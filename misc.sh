#################################################
#						#
#		        ----ALIASES----         #
#						#
#################################################
# Scripts
alias darkMatter='/home/liv/Documents/Programming/Projects/Bash/darkMatter/darkMatter.sh'

# Complex
alias animate='/usr/bin/curl -s "$(shuf -n 1 /home/liv/.init/data/animations.txt)" | /usr/bin/pv -q -L 3000'

# Simple
alias public_ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias local_ip='hostname -I | sed "s/ .*//"'
alias hgrep='history | grep -e'
alias bashrc='cd;source .bashrc; cd -'

# Renames
alias music='/usr/bin/pianobar'
alias hi='history'
alias jo='jobs'

# Overrides
alias touch='mktouch'

#Fix mistakes / defence against trains
alias lS='ls'
alias Ls='ls'
alias LS='ls'
alias sl='ls'
alias sL='ls'
alias Sl='ls'
alias SL='ls'
#################################################
#						#
#		       ----FUNCTIONS----        #
#						#
#################################################
# Switch bash
swb() {
        cd

        [ ! -f .bashrc.bak ] && cp .bashrc .bashrc.bak

        cp .bashrc /tmp/bashrc.bak
        cp .bashrc.bak .bashrc
        cp /tmp/bashrc.bak .bashrc.bak

        cd -
        bashrc
}

# Help from cheat.sh git repo:
cheat() {
	/usr/bin/curl 'cheat.sh/'"$(echo $@ | tr ' ' '+')"
}

# Travel up some number of directories
up() {
    local HEIGHT=''

    for i in `seq 1 $1`
    do
        HEIGHT+="../"
    done

    [[ ! ${HEIGHT} == '' ]] && cd ${HEIGHT}
}

# Check network connectivity
net_check() {
    nc -w 3 -z 8.8.8.8 53 && return 0 || return 1
}

# mktouch
mktouch() {
    mkdir -p $(dirname $1) && $(echo 'touch') $1
}

goto() {
    if [ -d "$(dirname $(type $1 | cut -d' ' -f5 | tr -d \' | tr -d \`))" ]
    then
        cd $(dirname $(type $1 | cut -d' ' -f5 | tr -d \' | tr -d \`))
    fi
}

ls_tree(){
	ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}
