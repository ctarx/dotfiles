#!/bin/sh

unalias -a


# Utilities
alias \
    cp='cp -iv' \
    mv='mv -iv' \
    rm='rm -vI' \
    mkdir='mkdir -pv' \
    ..='cd ../'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias open='xdg-open'
alias less='less -R'

alias '?'=duck

alias \
    ls='lsd --group-dirs first' \
    ll='lsd -lAh --blocks permission,group,size,date,name  --date relative --group-dirs first' \
    l='lsd -lh --group-dirs first'

alias tmux='tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf'
alias grep='grep -i --color=auto'
alias curl='curl -L'

alias free='free -h'
alias df='df -h'
alias top="htop"

# Use neovim for vim if present.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# nvim update plugins
alias nvim-update='nvim +PlugUpgrade +PlugInstall +PlugUpdate + CocUpdate +qa'


# extract:  Extract most know archives with one command
# ---------------------------------------------------------
ext() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1 ;;
            *.tar.gz)    tar xzf $1 ;;
            *.tar.xz)    tar xJf $1 ;;
            *.bz2)       bunzip2 $1 ;;
            *.rar)       unrar e $1 ;;
            *.gz)        gunzip $1  ;;
            *.tar)       tar xf $1  ;;
            *.tbz2)      tar xjf $1 ;;
            *.tgz)       tar xzf $1 ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1                ;;
            *)    echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
}

alias ipinfo='curl ipinfo.io'
alias weather='curl wttr.in'

chsheet() {
# Cheatsheets https://github.com/chubin/cheat.sh
curl -L 'https://cheat.sh/$1'
}

# GIT
alias \
        ga='git add' \
        gd='git diff' \
        gco='git checkout' \
        gs='git status' \
        gci='git commit' \
        gl='git pull' \
        gp='git push' \
        gpp='git pull; git push' \
        gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Add an "alert" alias for long running commands.  Use like so:
#       sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Reload the shell (i.e. invoke as a login shell)
alias reload='exec ${SHELL} -l'

# System update
alias sys-updt='sudo apt update && sudo apt list --upgradable && sudo apt full-upgrade && sudo apt autoremove && flatpak update'

# Update python packages
alias pip-updt='pip freeze --user | cut -d'=' -f1 | xargs -n1 pip install -U'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'