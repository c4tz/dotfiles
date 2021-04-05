if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
            [ -x "$f" ] && . "$f"
    done
    unset f
fi

# x settings
xsetroot -cursor_name left_ptr &
xrdb -merge "$HOME/.Xresources"
~/.config/autorandr/postswitch.d/keyboard &

# make qt5 apps use gtk theme
export QT_QPA_PLATFORMTHEME=gtk2

# fonts
xset +fp ~/.fonts/dina-powerline
xset fp rehash

# wm stuff
picom -CG --no-fading-openclose --experimental-backends &
sxhkd &
bspwm
