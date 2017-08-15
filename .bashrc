#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\[\033[1;33m\][\t] \[\033[1;32m\][\u@\h /\W] \\$ \[\033[0m\] "
