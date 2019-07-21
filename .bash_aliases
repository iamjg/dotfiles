#!/bin/bash

alias ls='ls --color=auto'
alias ll='ls --all --human-readable -l'
alias l.='ls --directory .*'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias lzgrep='lzgrep --color=auto'
alias lzegrep='lzegrep --color=auto'
alias lzfgrep='lzfgrep --color=auto'
alias bzgrep='bzgrep --color=auto'
alias zipgrep='zipgrep --color=auto'
alias zstdgrep='zstdgrep --color=auto'

alias diff='diff --color=auto'

alias watch='watch --color'

alias gcov='gcov --use-colors'

alias weather='curl https://wttr.in/London'

alias pid="xprop _NET_WM_PID | cut -d' ' -f3"

alias g='git'
alias findgit="find . -mindepth 1 -maxdepth 2 -type d -name '.git' -printf \"%h\n\""
alias batchpull="findgit | xargs -P10 -I{} git -C '{}' pull origin master:master"
alias batchco="findgit | xargs -P10 -I{} bash -c \"git -C '{}' stash -u; git -C '{}' checkout master\""
alias batchbr="findgit | xargs -I{} bash -c 'br \"{}\"' _ {}"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

