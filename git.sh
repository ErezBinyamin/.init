# Everyday
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'

# logging
alias gl='git log'
alias glg='git log --graph'
alias gl1='git log -n 1'

# Reseting
alias gr='git reset HEAD'
alias grhh='git reset --hard HEAD'

# Prompt
# COLORS:
#       Green : Up to date
#       Yellow: Ready to commit
#       Red   : Unstaged changes
__git_repo='`[ $PROMPT_GIT_PARSE -eq 1 ] && \
[[ "$(git rev-parse --git-dir 2> /dev/null)" =~ git ]] && \
printf " \[\033[1;38;5;6m\][\[\033[00m\]" && \
printf "\[\033[1;38;5;"\
"$(( $(git rev-parse --show-toplevel | xargs basename | md5sum | tr -d -c 0-9 | cut -c 1-18 | sed "s/^0*//") % 255 ))"\
"m\]◀ $(git rev-parse --show-toplevel | xargs basename) ▶"\
&& printf "\[\033[1;38;5;6m\]]\[\033[00m\]"`'

__git_color='`[ $PROMPT_GIT_PARSE -eq 1 ] && \
[[ "$(git rev-parse --git-dir 2> /dev/null)" =~ git ]] && \
printf " \[\033[1;48;5;2m\]" && \
printf "$(git diff-index --quiet --cached HEAD -- || printf "\[\033[1;48;5;3m\]")" && \
printf "$(git diff --quiet || printf "\[\033[1;48;5;1m\]*")" && \
printf "$( [ -z "$(git ls-files --exclude-standard --others)" ] || printf "\[\033[1;48;5;1m\]+")"`'

__git_branch='`[ $PROMPT_GIT_PARSE -eq 1 ] && \
[[ "$(git rev-parse --git-dir 2> /dev/null)" =~ git ]] && \
git branch 2> /dev/null | grep -e ^* | sed "s:* ::"`'


