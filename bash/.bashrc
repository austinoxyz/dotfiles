# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

[ -f "$HOME/.config/.env" ]  && source "$HOME/.config/.env"
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"
[ -f "$HOME/.cargo/env" ]    && source "$HOME/.cargo/env"

HISTCONTROL=ignoreboth # no duplicate lines or lines starting with spaces
shopt -s histappend    # append to the history file, don't overwrite it
HISTSIZE=1000
HISTFILESIZE=2000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
    alacritty) color_prompt=yes;;
esac

force_color_prompt=yes
color_prompt=yes

if [ "$color_prompt" = yes ]; then
#    OLD_PS1='\[\033[31m\][\[\033[32m\]${debian_chroot:+($debian_chroot)}\u\[\033[33m\]\[\033[36m\]@\[\033[34m\]\h \[\033[35m\]\w\[\033[31m\]]\[\033[33m\]\$ \[\033[37m\]'; PROMPT_DIRTRIM=1
    PS1='[\[\033[37m\]\t] \[\033[31m\]\W \[\033[33m\]\\$ \[\033[0m\]'
    PS2='\[\033[33m\] > \[\033[0m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# check and update window buffer size if needed after each command
shopt -s checkwinsize

# allow all new terminals to be colored by wal
# cat ~/.cache/wal/sequences

# vi mode 
# doesn't work in alacritty?
# set -o vi

. "$HOME/.cargo/env"

