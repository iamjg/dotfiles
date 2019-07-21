# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function include {
    [[ -r "$1" ]] && source "$1"
}

include ~/.bash_shopt 
include ~/.bash_functions
include ~/.bash_aliases
include ~/.git-prompt.sh
include /usr/share/bash-completion/bash_completion
include /etc/profile.d/autojump.bash

# Colors (man console_codes)
BLACK=0
RED=1
GREEN=2
YELLOW=3
BLUE=4
MAGENTA=5
CYAN=6
WHITE=7
BLACK_BRIGHT=8
RED_BRIGHT=9
GREEN_BRIGHT=10
YELLOW_BRIGHT=11
BLUE_BRIGHT=12
MAGENTA_BRIGHT=13
CYAN_BRIGHT=14
WHITE_BRIGHT=15

HISTCONTROL='ignoreboth:erasedups'
HISTFILESIZE=
HISTIGNORE='ls:exit'
HISTSIZE=
HISTTIMEFORMAT="$(echo -e "$(tput bold; tput setaf $RED)"%F %T$(tput sgr0):) "
INPUTRC="~/.inputrc"
PATH="$PATH:$HOME/.local/bin"
PROMPT_COMMAND=
PS0=
user=
function setup_ps1 {
    local date='$(date +%T)'
    local username='\[$(tput setaf $YELLOW)\]\u\[$(tput sgr0)\]'
    local username2='\[$(tput setaf $YELLOW)\]\u\[$(tput sgr0)\]'
    local hostname='\[$(tput setaf $BLUE)\]\h\[$(tput sgr0)\]'
    local working_dir='\[$(tput setaf $MAGENTA)\]\w\[$(tput sgr0)\]'
    local git_prompt='$(__git_ps1 [\[$(tput setaf $BLUE_BRIGHT)\]%s\[$(tput sgr0)\]])'
    PS1="[${date}][${username}@${hostname} ${working_dir}]${git_prompt}$ "
}
setup_ps1
PS2='continue > '
PS3='select a number > '
PS4="${LINENO} > "

export EDITOR='vim'
export VISUAL="$EDITOR"
export TMPDIR='/tmp/'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export GREP_COLOR='1;32'
# Where user-specific configurations should be written (analogous to /etc).
export XDG_CONFIG_HOME="$HOME/.config"
# Where user-specific non-essential (cached) data should be written (analogous to /var/cache).
export XDG_CACHE_HOME="$HOME/.cache"
# Where user-specific data files should be written (analogous to /usr/share).
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS='/usr/local/share:/usr/share'
export XDG_CONFIG_DIRS='/etc/xdg'

