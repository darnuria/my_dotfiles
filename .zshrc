# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
else
    echo "Didn't found: $HOME/.local/bin"
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(archlinux bower coffee colored-man colorize command-not-found composer cp cpanm django encode64 git git-extras mvn node npm nyan perl pip postgres python redis-cli screen svn themes virtualenv)
plugins=(colored-man colorize command-not-found themes screen)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export CC=gcc
export CXX=g++
export EDITOR=vim
export PYTHONIOENCODING=utf_8

if [ $OSTYPE = "linux-gnu" ] ; then
    export LS_OPTIONS='--color=auto'
    umask 022
    eval "`dircolors`"
    set -C
elif [ $OSTYPE = "darwin12" ] ; then
    export CLICOLOR=1
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

if [ -d "$HOME/.local/lib" ] ; then
    export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
else
    echo "Directory not found!"
fi

if [ $(id -u) -eq 0 ] ; then
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
fi

alias node="nodejs"
alias grep="grep --color"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

upgrade() {
    sudo apt-get update \
        && sudo apt-get dist-upgrade \
        && sudo apt-get --purge autoremove
}
