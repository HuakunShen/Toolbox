# setup command prompt
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[38;5;10m\]\u@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\$(parse_git_branch)\n> \[$(tput sgr0)\]"


# Only for WSL
# win10 app shortcut
# alias typora="/mnt/c/Program\ Files/Typora/Typora.exe"
# alias subl="/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
# alias sublime_text="/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
# alias atom="/mnt/c/Users/shenh/AppData/Local/atom/atom.exe"

# helper functions
# mkdir and cd
function mcd {
    if [ $# -eq 0 ]
    then
        echo 'Missing Argument (directory), Usage: mcd dirname'
        exit
    fi
    if [ -d $1 ]
    then
        cd $1
    else
        mkdir $1
        cd $1
    fi
}
alias mcd='mcd'

# Shortcut for "grep -Rn <keyword>"
# search in all files in dir
# search for keyword in files and return filenames containing the keyword
function search {
    # $1 is search content
    # $2 is target directory
    if [ $# -eq 0 ]
    then
        echo 'Missing Arguments (search content, and [optional] target dir)'
        exit
    elif [ $# -eq 1 ]
    then
        grep -Rn $1
    elif [ $# -eq 2 ]
    then
        grep -Rn $1 $2
    fi
}
alias search='search'

# Shortcut for find command
# Function: find a file by keyword recursively
function ff {
    find . -name $1
}
function ffi {
    find . -iname $1   
}

alias ff='ff'
alias ffi='ffi'


# only for WSL
# enter win address and translate then cd into the corresponding linux address
# e.g.
# cdwin C:\A\B = cd /mnt/c/A/B
function cdwin {
    path=$1
    tmpPath=$(echo $path | sed 's/\\/\//g')
    echo $tmpPath
    disk=$(echo $tmpPath | cut -d ':' -f 1 | awk '{print tolower($0)}')
    tmpPath=$(echo $tmpPath | cut -d ':' -f 2)
    path="/mnt/$disk$tmpPath"
    cd $path
}
alias cdwin='cdwin'


alias PATH="echo $PATH | tr ':' '\n'"


