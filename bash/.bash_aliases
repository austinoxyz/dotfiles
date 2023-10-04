# austinoxyz/.bash_aliases

# ============================================================================
# Convenience

alias la='ls -lAh'
alias ll='ls -lh'

# set random wallpaper
alias rw='wal -i ${WALLPAPERS_DIR} -o ${WALSCRIPTS_DIR}/genzathurarc --saturate 0.85 -b "#323232" > /dev/null 2>&1'

# reset xset parameters
alias fix-xset='xset r rate 200 40 m 0 0'
alias fx='xset r rate 200 40 m 0 0'

# apply and unapply redshift to my monitors 
alias apply-redshift="xrandr --output DP-0 --mode 1920x1080 --rate 60.00 --brightness 0.9 --gamma 0.9:0.9:0.9 --output DP-2 --right-of DP-0 --mode 1920x1080 --rate 1440.00 --brightness 0.9 --gamma 0.9:0.9:0.9 --crtc 1"
alias unapply-redshift="xrandr --output DP-0 --mode 1920x1080 --rate 60.00 --brightness 1 --gamma 1:1:1 --output DP-2 --right-of DP-0 --mode 1920x1080 --rate 144.00 --brightness 1 --gamma 1:1:1 --crtc 1"

# create and edit a new shell script without having to manually adjust permissions
# Usage: mksh [filename]
mksh() { 
    echo "#!/bin/sh" > $1 && chmod u+x $1 && nvim $1 
}

# quick startup function that creates a simple proj dir for c/c++ 
# that contains a minimal build script ready to go
# Usage: mkcprojdir [name] [c|cpp]
mkcprojdir() {
    [ "$#" -ne 2 ] && echo "Invalid number of arguments." >&2 && return
    [ -d "$1" ] && echo  "Directory already exists." >&2 && return

    CC=''
    template_fpath=''
    case "$2" in
        "c")   CC='gcc'; template_fpath="${XDG_TEMPLATES_HOME:-$HOME/Templates}/main.c"    ;;
        "cpp") CC='g++'; template_fpath="${XDG_TEMPLATES_HOME:-$HOME/Templates}/main.cpp"  ;;
        *)     echo "Invalid filetype." >&2 && return ;;
    esac

    if [ ! -f "$template_fpath" ]; then echo "Template doesn't exist." >&2 && return; fi 

    if ! mkdir "$1"; then echo "Failed to create directory."  >&2 && return; fi 
    if ! cd "$1";    then echo "Failed to cd into directory." >&2 && return; fi

    if ! cp "$template_fpath" "main.$2"; then echo "Failed to copy template" >&2 && return; fi

    echo "$CC -o main main.$2 -Wall -Wextra -Werror" > build.sh && chmod u+x build.sh

    nvim main.$2
}

# concat multiple files with filename section headers
alias cat-w-fnames="tail -n +1 "

# clear out a file
# Usage: clrfile [name]
clrfile() {
    [ "$#" -ne 1 ] && echo "Invalid number of arguments." >&2 && return
    [ ! -f "$1" ] && echo  "File doesn't exist." >&2 && return
    echo -n > "$1"
}

# ============================================================================
# Git

# generate github deploy key
alias gen-deploy-key="ssh-keygen -t ed25519 -C 'aodonnell2536.3@gmail.com'"

# see changes since last commit
alias diff-last-commit='git diff > diff.diff && nv diff.diff'

# gap last commit and stage hunks
alias gap='git add -p'

# ============================================================================

# change history file of wget
alias wget="wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts"

# ============================================================================
# Software

alias xmrig='~/Applications/xmrig/xmrig -o us-west.minexmr.com:4444 -u 41ifEWnkJtRFfWuvpzX4s7VvgZPbgeGxEdX2KffiDZs74VtT4VRin765uPfEQpx9xuTCwzzZWWJ2f8Q6icedQinGQWQrws8 -k --coin monero --cpu-memory-pool=4 --log-file="~/logs/xmrig/xmrig.log"'
alias vpn='sudo openvpn --config ~/.vpn/atlanta.ovpn'
alias tor='cd $HOME/Software/tor-browser;./Browser/start-tor-browser.desktop'
alias nv='PATH=$PATH:$HOME/.config/nvim/lua/austino nvim'
alias btc='$HOME/Software/Electrum-4.3.3/run_electrum & disown'
alias zig='$HOME/Software/zig-linux-x86_64-0.11.0-dev.3664+0f5aff344/zig'

# ============================================================================
# Games   

alias doom='${HOME}/Games/GZDoom/gzdoom/build/gzdoom'
alias quake="quakespasm -basedir ${HOME}/Games/Quake/"

# ============================================================================
# MacOS :^)

# clean up stupid '._*' files that MacOS leaves around
alias dot_clean="find . -type f -name '._*' -delete"

# clean up swap files that MacOS leaves in the working directory (for some reason)
alias swp_clean="find . -type f -name '.*.swp' -delete"

