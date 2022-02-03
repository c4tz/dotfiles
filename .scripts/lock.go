package main

import (
    "github.com/vova616/screenshot"
    "github.com/BurntSushi/xgb"
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

    // find primary monitor's position and resolution
    primaryChan := make(chan xinerama.ScreenInfo)
    go func() {
        c, _ := xgb.NewConn()
        xinerama.Init(c)
        reply, _ := xinerama.QueryScreens(c).Reply()
        c.Close()
        primaryChan <- reply.ScreenInfo[0]
    }()

    // take screenshot and pixelate
    screen, _ := screenshot.CaptureScreen()
    gift.New(gift.Pixelate(10)).Draw(screen, screen)

    // wait for threads to finish
    primary := <-primaryChan
    icon := <-iconChan

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
    format := strconv.Itoa(screen.Bounds().Dx()) + "x" +
              strconv.Itoa(screen.Bounds().Dy()) + ":rgbx"
    i3 := exec.Command(
        "i3lock",
        "--raw", format,
        "-i", "/dev/stdin",
        "--insidever-color=#ffffff00",
        "--ringver-color=#0000bb00",
        "--insidewrong-color=#CF42C100",
        "--ringwrong-color=#b94646aa",
        "--inside-color=#eeeeee00",
        "--ring-color=#46b995aa",
        "--line-color=#319576aa",
        "--separator-color=#ffffff00",
        "--verif-color=#ffffffaa",
        "--wrong-color=#b9466000",
        "--time-color=#ee00e0ee",
        "--date-color=#ee00e0ee",
        "--layout-color=#000000ff",
        "--keyhl-color=#23c2c6aa",
        "--bshl-color=#23c2c6aa",
        "--ring-width=10",
        "--screen=1",
        "--radius=" + radius,
        "--verif-text=\"\"",
        "--wrong-text=\"\"",
        "--noinput-text=\"\"",
        "--lock-text=\"\"",
        "--lockfailed-text=\"\"",
    )
    i3.Stdin = bytes.NewBuffer([]byte(screen.Pix))
    i3.Run()
}
