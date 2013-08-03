cd $HOME/.dotfiles
echo "cd to dotconfig"

link () {
    if [ ! -L $HOME/.$1 ]; then
        mv "$HOME/.$1" "$HOME/.$1.bak"
        ln -s "`pwd`/$1" "$HOME/.$1"
        echo "success link $1"
    else
        echo "link $1 exist"
    fi
    }

link vim
link vimrc
link zshrc
link gitconfig

