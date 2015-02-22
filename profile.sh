# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
    fi
fi

PATH=/bin

export TERM=xterm-256color

# Include /usr/bin into PATH.
if [ -d "/usr/bin" ] ; then
    PATH="/usr/bin:$PATH"
fi

# Include /sbin into PATH.
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi

# Include /usr/sbin into PATH.
if [ -d "/usr/sbin" ] ; then
    PATH="/usr/sbin:$PATH"
fi

# Include $HOME/usr/local/bin into PATH
if [ -d "$HOME/usr/local/bin" ] ; then
    PATH="$HOME/usr/local/bin:$PATH"
fi

# Include /usr/local/bin into PATH
if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi

# Haskell binaries packages
# Include $HOME/.cabal/bin into PATH.
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# Include $HOME/bin into PATH.
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Include $HOME/.local/bin into PATH.
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# TODO
# Source ~/.bashrc if bash is default terminal
if [ -f "$HOME/.bashrc" ] ; then
    source $HOME/.bashrc
fi
