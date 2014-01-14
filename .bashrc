#!/bin/bash
#
# Author : Axel Viala
# Forked from : mandark's bashrc
# src : mdk.fr
# Licence : Unlicence see UNLICENCE.txt
#

#if not running interactively, don't do anything more
[ -z "$PS1" ] && return
[ "$(cut -d. -f1 /proc/loadavg)" -gt 5 ] && return

shopt -s checkwinsize
shopt -s cdspell
shopt -s dirspell 2>/dev/null # Only in bash 4
shopt -s autocd   2>/dev/null # Only in bash 4
shopt -s globstar 2>/dev/null # Only in bash 4
shopt -s nocaseglob

# http://nion.modprobe.de/blog/archives/572-less-colors-for-man-pages.html
export LESS_TERMCAP_mb=$'\E[01;31m'    # debut de blink
export LESS_TERMCAP_md=$'\E[01;31m'    # debut de gras
export LESS_TERMCAP_me=$'\E[0m'        # fin
export LESS_TERMCAP_so=$'\E[01;44;33m' # début de la ligne d'état
export LESS_TERMCAP_se=$'\E[0m'        # fin
export LESS_TERMCAP_us=$'\E[01;32m'    # début de souligné
export LESS_TERMCAP_ue=$'\E[0m'        # fin
export EDITOR='vim'
export PYTHONIOENCODING=utf_8
export LS_OPTIONS='--color=auto'

export HISTCONTROL=ignoredups
export HISTFILESIZE=5000
export HISTSIZE=5000

umask 022
eval "`dircolors`"
set -C

# I don't like the default blue (That is too dark for me)
tput initc 12 400 400 1000

str_sum()
{
    BC=$(which bc)
    if [ -z "$1" ]
    then
        echo "Usage str_sum STRING"
        return
    fi
    if [ -x "$BC" ] ; then
        printf "%s" "$1" | hexdump -b | head -n 1 | tr ' ' '+' \
            | sed 's/\+*$//g' | bc
    else
        echo 0
    fi
}

HOSTNAME_SUM=$(str_sum "$(hostname)")
HOSTNAME_BOLD=$(( ($HOSTNAME_SUM + 1) % 2))
HOSTNAME_HUE=$(( ($HOSTNAME_SUM + 3) % 6 + 31))

USERNAME_SUM=$(str_sum "$(whoami)")
USERNAME_BOLD=$(( ($USERNAME_SUM + 1) % 2))
USERNAME_HUE=$(( ($USERNAME_SUM + 2) % 6 + 31))

HOSTNAME_COLOR=$'\E'"[$HOSTNAME_BOLD;${HOSTNAME_HUE}m"
USERNAME_COLOR=$'\E'"[$USERNAME_BOLD;${USERNAME_HUE}m"

WHITE=$'\E[00m'

if [ $(id -u) -eq 0 ] ; then
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

parse_git_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}

PS1_trail=""
[ z"$USER" != z"root" ] && [ -f "$(which git)" ] && PS1_trail="$PS1_trail\$(parse_git_branch)"

[ "$TERM" != 'linux' ] && TITLE="\[\033]0;\u@\H:\w\a\]" || TITLE=''

export PS1="$TITLE\[$USERNAME_COLOR\]\u\[$WHITE\]@\[$HOSTNAME_COLOR\]\H\[$WHITE\]$PS1_trail"'\$ '

alias grep="grep --color"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ...=".. 2"
alias ....=".. 3"
alias .....=".. 4"
alias scr='screen -D -R -U -h 424242'
alias lintian='lintian --pedantic -v -iI --display-experimental --show-overrides'
alias fingerprint='find /etc/ssh -name "*.pub" -exec ssh-keygen -l -f {} \;'
alias wi='wicd-curses'
alias tmux='tmux -2'
alias v='vim'
alias e='emacs -nw'
alias st='/home/darnuria/mybin/Sublime\ Text\ 2/sublime_text'
alias makej='make -j3'

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

..()
{
    for ((j=${1:-1},i=0;i<j;i++))
    do
        builtin cd ..
    done
}

# Json pretty printer
jsonpp()
{
    input="$([ $# -gt 0 ] && printf "%s\n" "$*" || cat -)"
    if ! [ z"$(which pygmentize)" = z"" ] ; then
        printf "%s" "$input" | python -mjson.tool | pygmentize -l js || printf "%s\n" "$input"
    else
        printf "%s" "$input" | python -minput.tool || printf "%s\n" "$input"
    fi
}

urldecode()
{
    input="$([ $# -gt 0 ] && printf "%s\n" "$*" || cat -)"
    python -c "import urllib2, sys; print urllib2.unquote(sys.argv[1])" "$input"
}

urlencode()
{
    input="$([ $# -gt 0 ] && printf "%s\n" "$*" || cat -)"
    python -c "import urllib2, sys; print urllib2.quote(sys.argv[1])" "$input"
}

# Removes *~ and #*# files in curent folder, for a depth limited to 3 folders.
clean()
{
    find -maxdepth 3 -name .emacs_backups -prune \
        -o \( -type f -a \
        \( -name '*~' -o -name '#*#' -o -name '._*' \) \
        \) \
        -print0 | xargs -0 rm -f
}

# Try to restore environment variable of an ssh-agent
ssh-agent-restore()
{
    select AUTH_SOCK in /tmp/ssh-*/*
    do
        export SSH_AUTH_SOCK="$AUTH_SOCK"
        export SSH_AGENT_PID="${SSH_AUTH_SOCK##/*/*.}"
        return
    done
}

# Like pydoc, opens a manual page of a PHP function.
phpdoc()
{
    lynx "/usr/share/doc/php-doc/html/function.$(printf "%s" "$*" | sed 's/[^a-zA-Z0-9]/-/g').html"
}
