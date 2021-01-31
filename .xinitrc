if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
            [ -x "$f" ] && . "$f"
    done
    unset f
fi

# x settings
xset -b
xsetroot -cursor_name left_ptr &
numlockx &
xrdb -merge "$HOME/.Xresources"
xmodmap ~/.Xmodmap
xset r rate 250 50

# make qt5 apps use gtk theme
export QT_QPA_PLATFORMTHEME=gtk2

# fonts
xset +fp ~/.fonts/dina-powerline
xset fp rehash

# wm stuff
picom -CG --no-fading-openclose --experimental-backends &
sxhkd &
bspwm
