#!/bin/bash

install_dir=`pwd`

function make_symlinks() {
    echo "Making symlinks"
    cd $HOME
    ln -sf $install_dir/bashrc.sh        .bashrc
    ln -sf $install_dir/zshrc            .zshrc
    ln -sf $install_dir/vimrc            .vimrc
    ln -sf $install_dir/vim              .vim
    ln -sf $install_dir/tmux.conf        .tmux.conf
    ln -sf $install_dir/gitconfig        .gitconfig
    ln -sf $install_dir/profile.sh       .profile
    ln -sf $install_dir/gitignore_global .gitignore_global
    ln -sf $install_dir/bash_logout.sh   .bash_logout

    #ln -sf $install_dir/tmux.conf .tmux.conf
    #ln -sf $install_dir/tmux.conf .tmux.conf

}

function main() {
    echo "Install Dotfiles!"
    make_symlinks
}

main
