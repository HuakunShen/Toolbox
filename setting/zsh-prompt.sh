# set zsh prompt
NEWLINE=$'\n'
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
# PROMPT="%F{082}%n%f%F{045}[%~]%f$(parse_git_branch)${NEWLINE}> "
PROMPT="%F{082}%n%f%F{045}[%~]%f${vcs_info_msg_0_}${NEWLINE}> "