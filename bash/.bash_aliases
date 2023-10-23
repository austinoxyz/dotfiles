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
alias apply-redshift="xrandr --output DP-0 --mode 1920x1080 --rate 60.00 --brightness 0.9 --gamma 0.9:0.9:0.9 --output DP-2 --left-of DP-0 --mode 1920x1080 --rate 1440.00 --brightness 0.9 --gamma 0.9:0.9:0.9 --crtc 1"
alias unapply-redshift="xrandr --output DP-0 --mode 1920x1080 --rate 60.00 --brightness 1 --gamma 1:1:1 --output DP-2 --left-of DP-0 --mode 1920x1080 --rate 144.00 --brightness 1 --gamma 1:1:1 --crtc 1"

alias setup-monitors="`cat ${SCRIPTS}/commands/setup-monitors.sh`"

# create and edit a new shell script without having to manually adjust permissions
# Usage: mksh [filename]
mksh() { 
    [ "$#" -gt 1 ] && echo "Invalid number of arguments." >&2 && return

    filename=''
    if [ "$#" -eq 1 ]; then  
        filename="${1}"
    else
        filename="script.sh"
    fi

    printf "#!/bin/sh\n" > ${filename} && chmod u+x ${filename} && nvim ${filename} 
}

# quick startup function that creates a simple proj dir for c/c++ 
# that contains a minimal build script ready to go
# Usage: mkcprojdir [name] [c|cpp]
mkcprojdir() {
    [ "$#" -ne 2 ] && echo "Invalid number of arguments." >&2 && return
    [ -d "$1" ] && echo  "Directory already exists." >&2 && return

    dirname="${1}"
    ext="${2}"

    compiler=''
    case "${ext}" in
        "c")   compiler='gcc' ;; 
        "cpp") compiler='g++' ;; 
        *)     echo "Invalid filetype." >&2 && return ;;
    esac

    template_fpath="${XDG_TEMPLATES_HOME:-$HOME/Templates}/main.${ext}"
    if [ ! -f "$template_fpath" ]; then echo "Template doesn't exist." >&2 && return; fi 

    if ! mkdir -p "${dirname}"; then echo "Failed to create directory."  >&2 && return; fi 
    if ! cd "${dirname}"; then echo "Failed to cd into directory." >&2 && return; fi

    if ! cp "$template_fpath" "main.${ext}"; then echo "Failed to copy template" >&2 && return; fi

    echo "${compiler} -o main main.${ext} -Wall -Wextra -Werror" > build.sh && chmod u+x build.sh

    nvim main.${ext}
}

# open a c/c++ header and implementation file in a vertically split neovim instance
# Note: Will prefer to open .cpp/.hpp files over .c/.h files.
# Usage: openctab [name]
opensplit() {
    if [ "$#" -gt 1 ] || [ "$#" -eq 0 ]; then 
        echo "Invalid number of arguments." >&2 && return
    fi

    [ ! -d "include" ] && echo "'include/' directory doesn't exist." >&2 && return
    [ ! -d "src" ] && echo "'src/' directory doesn't exist." >&2 && return

    name="${1}"

    c_header_file="include/${name}.h"
    c_src_file="src/${name}.c"
    cpp_header_file="include/${name}.hpp"
    cpp_src_file="src/${name}.cpp"

    header_file=${cpp_header_file}
    [ ! -f "${header_file}" ] && header_file="${cpp_header_file}";

    src_file=${cpp_src_file}
    [ ! -f "${src_file}" ] && src_file="${cpp_src_file}";

    if [ ! -f "${header_file}" -a ! -f ${src_file} ]; then 
        echo "No files of this name exist." >&2 && return;
    fi

    nvim -O ${header_file} ${src_file}
}
alias osp="opensplit "

# concat multiple files with filename section headers
alias cat-with-filenames="tail -n +1 "
alias catwf="cat-with-filenames"

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

