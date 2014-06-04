# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
HISTFILESIZE=5000

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# - o - o - o - o - o - o - o - o - o - o - o - #
#calendar -A 4
#export PS1='\[\e[0;36m\][\[\e[0;32m\]\w\[\e[0;36m\]]\$ \[\e[0;0m\]'
export EDITOR=vi

#export PS1='\[\e[0;32m\][\[\e[0;36m\]\w\[\e[0;33m\]$(git_info)\[\e[0;32m\]]> \[\e[0;0m\]'
export PS1='\[\e[0;32m\][\[\e[0;36m\]\w\[\e[0;33m\]\[\e[0;32m\]]> \[\e[0;0m\]'
export PAGER=less
export RI='--format ansi --width 78'
export LESS='-R'

### functions ###
git_info() {
	git branch > /dev/null 2>&1
	br=$([ $? -eq 0 ] && git branch | awk '/^\*/{ print $2 }')
	[ ! -z $br ] && echo " ±($br)" && return
}
t() {
	F='TODO'
	[ -f $PWD/$F ] && F=$PWD/$F || F=~/$F
	if [ $# -eq 0 ]
	then
		cat -n $F
	else
		for i
		do
			echo $i | grep -q '^+' && [ ! -z "${i#+}" ] && echo "${i#+}" >> $F
			echo $i | grep -q '^-' && [ ! -z "${i#-}" ] && sed -i "${i#-}d" $F
		done
		cat -n $F
	fi
}

record() {
	in=$1
	ffmpeg -f alsa -ac 2  -f x11grab -r 30 -s 508x380 -i :0.0+35,110 -acodec pcm_s16le -vcodec libx264  -preset slow -crf 22 -threads 0 ${in}.mkv
}

## tab completion with sudo ##
#complete -fc sudo

# set vi mode
set -o vi

### Aliases ###
alias sl='ls -F'
alias l='ls -F'
alias rm='rm -i'
alias lynx='lynx -nocolor -force_html'
#alias xpdf='evince'
alias bsd='irssi -c chat.taucher.net -n arun'
alias irb='irb --simple-prompt'
alias wifi='sudo wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan0 -B'
alias vical='vi ~/.calendar/calendar'
alias c='calendar'
alias mtr='mtr -t'
#alias clj='java -cp /opt/clojure/clojure-1.5.1.jar clojure.main'
alias more=less
#alias ruby1.9='/opt/ruby/bin/ruby'
#alias irb1.9='/opt/ruby/bin/irb'

calendar -A 10
shopt -s cdspell
shopt -s histappend

# start tmux when opening urxvt
[ ! $TMUX -a $XAUTHORITY ] && tmux

# Less Colors for Man Pages
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export PYTHONSTARTUP=~/.pythonrc
