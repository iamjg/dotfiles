#!/bin/bash

function br {
    echo "$1"
    git -C "$1" branch
    echo ""
}
export -f br

# Creates the directory along with parents (if it exists) and then changes the current directory to it.
# Arguments:
#   The directory
# Returns:
#   None
function take {
    mkdir --parents -- "$1" &&
    cd -- "$1"
}

# Swaps the names of two files.
# Arguments:
#   The first file
#   The second file
# Returns:
#   None
function swap {
    if [[ $# -ne 2 ]]; then 
        echo "swap: 2 arguments required"
        return 1
    fi

    if [[ ! -e $1 ]]; then
        echo "swap: file $1 does not exist"
        return 2
    fi

    if [[ ! -e $2 ]]; then
        echo "swap: file $2 does not exist"
        return 3
    fi

    local tmp=$(mktemp -t tmp.XXXXXXXXXX) &&
    mv -- "$1" "$tmp" &&
    mv -- "$2" "$1" &&
    mv -- "$tmp" "$2"
}

# Counts the number of files and directories under a path.
# Arguments:
#   The path (optional)
# Returns:
#   The number of files and directories under the specified diectory with a recursion depth of 1.
#   If no path is given, the current directory is used.
function count {
    if [[ $# == 0 ]]; then
        local current_dir=.
    elif [[ $# == 1 ]]; then 
        if [[ -d $1 ]]; then
            local current_dir="$1"
        else 
            echo "count: directory $1 does not exist"
            return 1
        fi
    else 
        echo "count: too many arguments"
        return 2
    fi

    pids=()
    local file_count=$(find "$current_dir" -maxdepth 1 -mindepth 1 -type f -printf x | wc --chars &) && pids+=$!
    local dir_count=$(find "$current_dir" -maxdepth 1 -mindepth 1 -type d -printf x | wc --chars &) && pids+=$!
    for pid in "${pids[@]}"; do
        wait $pid
    done

    echo -e "files: $file_count\ndirectories: $dir_count"
}

function print_colors_16 {
    for bg in {40..47} {100..107} 49; do
        for fg in {30..37} {90..97} 39; do
            for attr in 0 1 2 4 5 7 8; do
                echo -en "\e[${attr};${bg};${fg}m ^[${attr};${bg};${fg}m \e[0m"
            done
            echo
        done
    done
}

function print_colors_256 {
    for fgbg in 38 48 ; do # foreground / gackground
        for color in {0..255}; do
            printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
            # display 6 colors per line
            if [[ $((($color + 1) % 6)) == 4 ]]; then
                echo
            fi
        done
        echo
    done
}
