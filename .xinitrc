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

# fonts
xset +fp ~/.fonts/dina-powerline
xset fp rehash

# wm stuff
compton -b --vsync opengl
sxhkd &
bspwm
