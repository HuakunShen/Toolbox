# setup command prompt
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[38;5;10m\]\u@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\$(parse_git_branch)\n> \[$(tput sgr0)\]"


# Only for WSL
# win10 app shortcut
alias typora="/mnt/c/Program\ Files/Typora/Typora.exe"
alias subl="/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
alias sublime_text="/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
alias atom="/mnt/c/Users/shenh/AppData/Local/atom/atom.exe"

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

# search in all files in dir
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


alias printPATH="echo $PATH | tr ':' '\n'"