
stty erase 
set -o vi
set -o trackall
HN=$(uname -n)
export PS1=": $(/usr/bin/whoami)@${HN%%.*}[!]; "
: ""
export PAGER=less
export PRINTER=uaus08p02dbl
[[ -f $HOME/.kshaliases ]] && . $HOME/.kshaliases
[[ -f $HOME/.kshcd ]] && . $HOME/.kshcd
export SHELL=/bin/ksh
export PS1='$(vcs_ps1)'

umask 022

if [[ ! -f "${TERMINFO:-/usr/share/lib/terminfo}/${TERM%${TERM##?}}/$TERM" ]]
then
    if [[ -f "/opt/sfw/share/terminfo/${TERM%${TERM##?}}/$TERM" ]]
    then
	export TERMINFO=/opt/sfw/share/terminfo
    fi
fi

removeFromXPATH PATH .
#removeFromXPATH PATH /usr/gnu/bin
maybeAdd2XPATH PATH /usr/sbin
maybeAdd2XPATH PATH /sbin
#maybeAdd2XPATH PATH /usr/ccs/bin left
#maybeAdd2XPATH PATH /usr/sfw/bin
#maybeAdd2XPATH PATH /opt/sfw/bin
#maybeAdd2XPATH PATH $HOME/sw/bin
#maybeAdd2XPATH PATH $HOME/bin
#maybeAdd2XPATH PATH /opt/csw/bin right

if whence vim > /dev/null 2>&1
then
    if [[ "X$EDITOR" != X*vim* ]]
    then
	export EDITOR=vim
	alias vi=vim
    fi
fi

[[ "$TERM" = xterm ]] && TERM=xterm-color

unset PROFILE SS_PROFILE

if [[ -n "$CODEMGR_WS" ]]
then
    export PS1="$(/usr/gnu/bin/whoami)@${HN%%.*}:ws:${CODEMGR_WS##*/}[!]> "
fi

[[ -z "$ENV" ]] && export ENV=/export/home/nico/.kshrc.user
[[ -z "$HISTFILE" || ! -w "$HISTFILE" ]] && export HISTFILE=/tmp/.ksh_hist.$$
