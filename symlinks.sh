#! /bin/bash

mkdir -p $HOME/.config/bspwm
mkdir -p $HOME/.config/sxhkd
mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/xfce4/terminal
mkdir -p $HOME/.config/Code/User
mkdir -p $HOME/.config/gtk-3.0

ln -s $HOME/.dotfiles/bspwm/bspwmrc $HOME/.config/bspwm/bspwmrc
ln -s $HOME/.dotfiles/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc
ln -s $HOME/.dotfiles/polybar/config $HOME/.config/polybar/config
ln -s $HOME/.dotfiles/polybar/crypto-config $HOME/.config/polybar/crypto-config
ln -s $HOME/.dotfiles/polybar/crypto.py $HOME/.config/polybar/crypto.py
ln -s $HOME/.dotfiles/rofi/config $HOME/.config/rofi/config
ln -s $HOME/.dotfiles/xfce4/terminal/terminalrc $HOME/.config/xfce4/terminal/terminalrc
ln -s $HOME/.dotfiles/Code/User/settings.json $HOME/.config/Code/User/settings.json
ln -s $HOME/.dotfiles/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
ln -s $HOME/.dotfiles/.xinitrc $HOME/.xinitrc
ln -s $HOME/.dotfiles/.xprofile $HOME/.xprofile