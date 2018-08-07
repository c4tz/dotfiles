#!/usr/bin/env bash

icon="$HOME/.scripts/lock.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

if [[ $(hostname) == 'pc' ]]; then
    geometry='+2242+732'
    screen=1
    radius=127
fi

if [[ $(hostname) == 'laptop' ]]; then
    geometry='+3082+422'
    screen=2
    radius=123
fi

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -geometry $geometry -composite -matte "$tmpbg"

i3lock -i "$tmpbg"           \
--insidevercolor=#ffffff00   \
--ringvercolor=#0000bb00     \
--insidewrongcolor=#CF42C100 \
--ringwrongcolor=#b94660aa   \
--insidecolor=#eeeeee00      \
--ringcolor=#46b995aa        \
--linecolor=#319576aa        \
--separatorcolor=#ffffff00   \
--verifcolor=#ffffffaa       \
--wrongcolor=#b9466000       \
--timecolor=#ee00e0ee        \
--datecolor=#ee00e0ee        \
--layoutcolor=#000000ff      \
--keyhlcolor=#23c2c6aa       \
--bshlcolor=#23c2c6aa        \
--ring-width=10              \
--screen=$screen             \
--radius=$radius             \
--veriftext=""               \
--wrongtext=""               \
--noinputtext=""             \
--locktext=""                \
--lockfailedtext=""          \
