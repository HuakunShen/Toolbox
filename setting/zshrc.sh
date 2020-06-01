# set zsh prompt
NEWLINE=$'\n'
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
# PROMPT="%F{082}%n%f%F{045}[%~]%f$(parse_git_branch)${NEWLINE}> "
PROMPT="%F{082}%n%f%F{045}[%~]%f${vcs_info_msg_0_}${NEWLINE}> "

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
