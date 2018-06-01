#!/usr/bin/env bash

icon="$HOME/.dotfiles/i3lock/lock.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -geometry +3082+422 -composite -matte "$tmpbg"

i3lock -i "$tmpbg"           \
--insidevercolor=#ffffff00   \
--ringvercolor=#0000bb00     \
--insidewrongcolor=#CF42C100 \
--ringwrongcolor=#CF42C1ff   \
--insidecolor=#eeeeee00      \
--ringcolor=#46b995aa        \
--linecolor=#319576aa        \
--separatorcolor=#ffffffff   \
--verifcolor=#ffffffaa       \
--wrongcolor=#CF42C1ff       \
--timecolor=#ee00e0ee        \
--datecolor=#ee00e0ee        \
--layoutcolor=#000000ff      \
--keyhlcolor=#00DBF1ff       \
--bshlcolor=#00DBF1ff        \
--ring-width=10              \
--screen=2                   \
--radius=123                 \
--veriftext=""               \
--wrongtext=""               \
--noinputtext=""             \
--locktext=""                \
--lockfailedtext=""          \
