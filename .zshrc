# Performance check start
START=$(date +%s.%N)

# Do not stop output on CTRL-s
stty -ixon

# completion
autoload -Uz compinit
compinit

# Env vars
export EDITOR='vim'
export GIT_EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g ""'
export ZLE_RPROMPT_INDENT=0

export POWERLEVEL9K_FAIL_ICON=x
export POWERLEVEL9K_STATUS_OK=false
export POWERLEVEL9K_STATUS_CROSS=true
export POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
export POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3
export POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='white'
export POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='238'
export POWERLEVEL9K_EXECUTION_TIME_ICON=''
export POWERLEVEL9K_VI_INSERT_MODE_STRING=''
export POWERLEVEL9K_VI_COMMAND_MODE_STRING='VI'
export POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-remotebranch git-tagname)
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode virtualenv pyenv dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time)
export POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# keybindings
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey -M viins 'kj' vi-cmd-mode
bindkey 'kj' vi-cmd-mode

# fix special keys
typeset -A key
key=(
  Home       "${terminfo[khome]}"
  End        "${terminfo[kend]}"
  Insert     "${terminfo[kich1]}"
  Delete     "${terminfo[kdch1]}"
  Left       "${terminfo[kcub1]}"
  Right      "${terminfo[kcuf1]}"
  PageUp     "${terminfo[kpp]}"
  PageDown   "${terminfo[knp]}"
)
[[ -n "${key[Home]}"      ]] && bindkey "${key[Home]}"          beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey "${key[End]}"           end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey "${key[Insert]}"        overwrite-mode
[[ -n "${key[Delete]}"    ]] && bindkey "${key[Delete]}"        delete-char
[[ -n "${key[PageUp]}"    ]] && bindkey "${key[PageUp]}"        beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[Home]}"      ]] && bindkey -M vicmd "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -M vicmd "${key[End]}"  end-of-line

# Hit e in command mode to edit current command line.
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd e edit-command-line

# aliases
alias speedtest='wget -O /dev/null http://speedtest.belwue.net/1000G'
alias work_home="name=work folder=~/projects/work cmd='zsh -i -c \"vim\"' split=20 ~/.scripts/startmux.sh"
alias work_edit="name=editor folder=~/projects/work cmd='zsh -i -c \"vim\"' hook=logs ~/.scripts/startmux.sh"
alias work_logs="name=logs folder=~/projects/work cmd='zsh' hook=editor ~/.scripts/startmux.sh"

# misc stuff
eval "$(direnv hook zsh)"
# if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# auto startx if display is not set
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Performance Warning
END=$(date +%s.%N)
ZSHRC_PERF=$(printf %i $(echo "($END - $START) * 1000" | bc))
if (( $ZSHRC_PERF > 150)); then
  echo "\033[0;31mperformance warning!"
  echo ".zshrc startup time" $ZSHRC_PERF "ms"
fi
