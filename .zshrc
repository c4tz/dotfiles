# Do not stop output on CTRL-s
stty -ixon

# Env vars
export EDITOR='vim'
export GIT_EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g ""'

# Oh my zsh.
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-syntax-highlighting)
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# misc stuff
eval "$(direnv hook zsh)"

if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# auto startx if display is not set
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi
