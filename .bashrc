#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Powerline
if [ -f `which powerline-daemon` ]; then
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi

#PS1='[\u@\h \W]\$ '
#PS1="\[\033[1;33m\][\t] \[\033[1;32m\][\u@\h /\W] \\$ \[\033[0m\] "
