if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
            [ -x "$f" ] && . "$f"
    done
    unset f
fi

# x settings
xsetroot -cursor_name left_ptr &
numlockx &
xrdb -merge "$HOME/.Xresources"

# set capslock to work as escape
setxkbmap -option caps:escape

# fonts
xset +fp ~/.fonts/dina-powerline
xset fp rehash

# wm stuff
if [[ "$(cat /etc/hostname)" == *"pc"* ]]; then compton -b --vsync opengl ; fi
sxhkd &
bspwm
