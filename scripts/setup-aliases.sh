#!/bin/bash
echo "
alias sl='ls'

## grep aliases
alias grep="grep --color=auto"
alias ngrep="grep -n"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

## List open ports
alias ports="netstat -tulanp"

## Extract file, example. "ex package.tar.bz2"
ex() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz)  tar xzf $1 ;;
      *.bz2)     bunzip2 $1 ;;
      *.rar)     rar x $1 ;;
      *.gz)      gunzip $1  ;;
      *.tar)     tar xf $1  ;;
      *.tbz2)    tar xjf $1 ;;
      *.tgz)     tar xzf $1 ;;
      *.zip)     unzip $1 ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1 ;;
      *)         echo $1 cannot be extracted ;;
    esac
  else
    echo $1 is not a valid file
  fi
}

# alias cd='cd ; ls -arthl'

# ex() is copied from https://github.com/Raikia/Kali-Setup/blob/master/kali.py
#Add here..

# Docker aliases
alias dockerkillallimages='docker rmi $(docker images -a -q)'
alias dockerkillall='docker kill $(docker ps -q)'

# docker exec -it "$@" bash
dockergoto () {
docker exec -it "$@" /bin/sh
}

alias cls='clear'

" >> /etc/bash.bashrc
