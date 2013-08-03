#!/bin/bash

if [ ! -d $HOME/.dotfiles ]; then
    cd
    mkdir "$HOME/.dotfiles"
    cd ~/.dotfiles
    echo "create `pwd`"
else
    cd ~/.dotfiles
    echo "cd to `pwd`"
fi


link() {
    if [ ! -e $1 ]; then
        if [ -e $HOME/.$1 ]; then
            cp -r "$HOME/.$1" "./$1"
            mv "$HOME/.$1" "$HOME/.$1.bak"
            echo "success copy $1"
            ln -s "`pwd`/$1" "$HOME/.$1"
        else
            echo "$1 not exsit in ."
        fi
    else
        echo "$1 in dotfiles, ignore"
    fi
}

link vim
link vimrc
link zshrc
link gitconfig
link gitignore

if [ ! -d ~/.oh-my-zsh ]; then
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
