#!/bin/zsh

##############################################################################
#                                                                            #
# TMUX startup script                                                        #
#                                                                            #
# args (in order):                                                           #
#   name: session name                                                       #
#   folder: directory containing project subfolders                          #
#   cmd: command to be run in each window                                    #
#   (optional) hook: other session name/id to sync the window with           #
#   (optional) split: split each window in given percentage                  #
#                                                                            #
# example usages:                                                            #
#   - single terminal, with split:                                           #
#       name=work folder=~/projects/work cmd=vim split=20 startmux.sh        #
#   - two terminals, windows synced:                                         #
#       name=editor folder=~/projects/work cmd=vim hook=shell startmux.sh    #
#       name=shell folder=~/projects/work cmd=zsh hook=editor startmux.sh    #
#                                                                            #
##############################################################################

# workaround for wrong split size on startup
tmux -2 new-session -d -s $name -x "$(tput cols)" -y "$(tput lines)"

# loop through subfolders in $1 and create a new window for each
for subdir in $folder/*; do
    if [ -d "$subdir" ]; then
        wname=$(basename $subdir)
        tmux new-window -n $wname -t $name: -c $subdir $cmd
        if [ -v split ]; then
            tmux split-window -t $name:$wname -c $subdir -l ${split}% 'zsh'
        fi
    fi
done

# tmux automatically creates a new window for a new session
# remove it and shift all remaining window indices to the left
tmux kill-window -t $name:0
tmux move-window -t $name -r

# create a hook for window synchronization between sessions
# this is useful when having the console/log panes in/on another session/screen
if [ -v hook ]; then
    prefix="run-shell 'tmux selectw -t "
    suffix=":\$(tmux display-message -p \"#I\")'"
    tmux set-hook -t $name pane-focus-in "$prefix$hook$suffix"
fi

# switch if called inside tmux, attach if outside
if [ -z ${TMUX+x} ]; then
    tmux attach -t $name
else
    tmux switch -t $name
fi
