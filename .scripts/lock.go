package main

import (
    "github.com/BurntSushi/xgb"
    "github.com/BurntSushi/xgb/xproto"
    "github.com/BurntSushi/xgb/xinerama"
    "github.com/disintegration/gift"
    "image/png"
    "image"
    "os"
    "strconv"
    "bytes"
    "os/exec"
)

func main() {

    // read lock icon file
    iconChan := make(chan image.Image)
    go func() {
        fdLock, _ := os.Open(os.Args[1])
        pngLock, _ := png.Decode(fdLock)
        iconChan <- image.Image(pngLock)
    }()

    // init X connection
    c, _ := xgb.NewConn()
    defer c.Close()

    // get root window and its size
    root := xproto.Setup(c).DefaultScreen(c)
    rootWidth := root.WidthInPixels
    rootHeight := root.HeightInPixels

    // take screenshot
    screenChan := make(chan *image.RGBA)
    go func() {
        area := image.Rect(
            0,
            0,
            int(rootWidth),
            int(rootHeight),
        )

        x, y := area.Dx(), area.Dy()
        xImg, _ := xproto.GetImage(
            c,
            xproto.ImageFormatZPixmap,
            xproto.Drawable(root.Root),
            int16(area.Min.X),
            int16(area.Min.Y),
            uint16(x),
            uint16(y),
            0xffffffff,
        ).Reply()

        data := xImg.Data
        for i := 0; i < len(data); i += 4 {
            data[i], data[i+2], data[i+3] = data[i+2], data[i], 255
        }
        screenChan <- &image.RGBA{data, 4 * x, image.Rect(0, 0, x, y)}
    }()

    // find primary monitor's position and resolution
    primaryChan := make(chan xinerama.ScreenInfo)
    go func() {
        xinerama.Init(c)
        reply, _ := xinerama.QueryScreens(c).Reply()
        primaryChan <- reply.ScreenInfo[0]
    }()

    // wait for threads to finish
    primary := <-primaryChan
    icon := <-iconChan
    screen := <-screenChan

    // pixelate
    gift.New(gift.Pixelate(10)).Draw(screen, screen)

    // paste lock onto screenshot
    posX := int(primary.XOrg) + int(primary.Width/2) - (icon.Bounds().Max.X/2)
    posY := int(primary.YOrg) + int(primary.Height/2) - (icon.Bounds().Max.Y/2)
    gift.New().DrawAt(screen, icon, image.Pt(posX, posY), gift.OverOperator)

    // set ring radius based on device
    hostname, _ := os.Hostname()
    radius := "123"
    if hostname == "pc" {
        radius = "127"
    }

    // run i3lock with raw byte buffer as stdin
    i3 := exec.Command(
        "i3lock",
        "--raw",
        strconv.Itoa(int(rootWidth)) + "x" + strconv.Itoa(int(rootHeight)) + ":rgbx",
        "-i", "/dev/stdin",
        "--insidevercolor=#ffffff00",
        "--ringvercolor=#0000bb00",
        "--insidewrongcolor=#CF42C100",
        "--ringwrongcolor=#b94646aa",
        "--insidecolor=#eeeeee00",
        "--ringcolor=#46b995aa",
        "--linecolor=#319576aa",
        "--separatorcolor=#ffffff00",
        "--verifcolor=#ffffffaa",
        "--wrongcolor=#b9466000",
        "--timecolor=#ee00e0ee",
        "--datecolor=#ee00e0ee",
        "--layoutcolor=#000000ff",
        "--keyhlcolor=#23c2c6aa",
        "--bshlcolor=#23c2c6aa",
        "--ring-width=10",
        "--screen=1",
        "--radius=" + radius,
        "--veriftext=\"\"",
        "--wrongtext=\"\"",
        "--noinputtext=\"\"",
        "--locktext=\"\"",
        "--lockfailedtext=\"\"",
    )
    i3.Stdin = bytes.NewBuffer([]byte(screen.Pix))
    i3.Run()
}
