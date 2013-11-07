# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy" #candy
# use vi mode
bindkey -v

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sudo="sudo "
alias pacman="sudo apt-get"
alias copy="rsync -aP"
alias dist-update="sudo apt-get update && sudo apt-get dist-upgrade"
alias net="~/deepin-system-settings/modules/network/src/"
alias ass="~/deepin-system-settings/modules/application_associate/src/"
alias dss="~/deepin-system-settings/dss/"
alias tray="~/Project/deepin-system-tray/src/"
alias ui="~/Project/deepin-ui-private/"
alias zhuo="~/Project/web/zhuoshu_new/src"
alias ddoc="~/Project/Django-1.5.1/django/"
alias ack="ack-grep"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
. ~/Project/z/z.sh
plugins=(github debian rvm django ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export EDITOR="vim"
export GOPATH=$HOME/go
PATH=$PATH:$HOME/.rvm/bin:$GOPATH/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

#zstyle ‘:completion:*’ verbose yes
zstyle ":completion:*:functions" ignored-patterns "_*"

#zstyle ‘:completion:*:descriptions’ format ‘%B%d%b’

#zstyle ‘:completion:*:messages’ format ‘%d’

#zstyle ‘:completion:*:warnings’ format ‘No matches for: %d’

#zstyle ‘:completion:*’ group-name ”
