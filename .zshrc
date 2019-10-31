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

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# aliases
alias speedtest='wget -O /dev/null http://speedtest.belwue.net/1000G'

# misc stuff
eval "$(direnv hook zsh)"
# if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# auto startx if display is not set
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi

# export POWERLEVEL9K_FAIL_ICON=x
export POWERLEVEL9K_STATUS_OK=false
export POWERLEVEL9K_STATUS_CROSS=true
export POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-remotebranch git-tagname)
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv pyenv dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# Performance Warning
END=$(date +%s.%N)
ZSHRC_PERF=$(printf %i $(echo "($END - $START) * 1000" | bc))
if (( $ZSHRC_PERF > 150)); then
  echo "\033[0;31mperformance warning!"
  echo ".zshrc startup time" $ZSHRC_PERF "ms"
fi
