# austinoxyz/.bash_aliases

# Convenience
# ----------------------------------------------------------
alias la='ls -lAh'
alias ll='ls -lh'

alias +x='chmod u+x'
alias :q='exit'
alias ..='cd ..'
alias vim='nvim'

if [ ! -z "${UTILITY}" ] && [ -d "${UTILITY}" ]; then
    alias fx="${UTILITY}/setup-peripherals.sh"
    alias rw="${UTILITY}/random-wallpaper.sh"
    alias setmon="${UTILITY}/setup-monitors.sh"
    alias redon="${UTILITY}/redshift.sh"
fi

# specify history file when using `wget`
alias wget="wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts"

# clear nvim swap
alias clear-nvim-swap="rm -f ${XDG_STATE_HOME:-${HOME}/.local/state}/nvim/swap/%*"
# ----------------------------------------------------------

# Utility functions
# ----------------------------------------------------------

# Usage: mksh [filename]
# create and edit a new shell script without having to manually adjust permissions
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

# Usage: mkprojdir [c|cpp] [name]
# quick startup function that creates a simple proj dir for c/c++ 
# that contains a minimal build script ready to go
mkprojdir() {
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

    header_file=${c_header_file}
    [ ! -f "${header_file}" ] && header_file="${cpp_header_file}";

    src_file=${c_src_file}
    [ ! -f "${src_file}" ] && src_file="${cpp_src_file}";

    if [ ! -f "${header_file}" -a ! -f ${src_file} ]; then 
        echo "No files of this name exist." >&2 && return;
    fi

    nvim -O ${header_file} ${src_file}
}
alias osp="opensplit "
# ----------------------------------------------------------

# SSH
# ----------------------------------------------------------
alias ssha="eval "$(ssh-agent -s)""
# ----------------------------------------------------------

# Git
# ----------------------------------------------------------
alias gen-deploy-key="ssh-keygen -t ed25519 -C 'aodonnell2536.3@gmail.com'"
alias diff-last-commit='git diff >diff.diff && nv diff.diff'
alias gap='git add -p'
alias gg='git grep -n'
# ----------------------------------------------------------

# Pacman
# ----------------------------------------------------------
alias list-pacman-packages="pacman -Qqe"
# ----------------------------------------------------------

# Software
# ----------------------------------------------------------
alias xmrig='~/Applications/xmrig/xmrig -o us-west.minexmr.com:4444 -u 41ifEWnkJtRFfWuvpzX4s7VvgZPbgeGxEdX2KffiDZs74VtT4VRin765uPfEQpx9xuTCwzzZWWJ2f8Q6icedQinGQWQrws8 -k --coin monero --cpu-memory-pool=4 --log-file="~/logs/xmrig/xmrig.log"'
alias vpn='sudo openvpn --config ~/.vpn/atlanta.ovpn'
alias tor='cd $HOME/Software/tor-browser;./Browser/start-tor-browser.desktop'
alias nv='PATH=$PATH:$HOME/.config/nvim/lua/austino nvim'
alias btc='$HOME/Software/Electrum-4.3.3/run_electrum & disown'
alias zig='$HOME/Software/zig-linux-x86_64-0.11.0-dev.3664+0f5aff344/zig'
# ----------------------------------------------------------

# Games   
# ----------------------------------------------------------
alias doom='${HOME}/Games/gzdoom/build/gzdoom'
alias quake="quakespasm -basedir ${HOME}/Games/Quake/"
alias zork="cd ${HOME}/Games/Zork1 && dosbox ${HOME}/Games/Zork1/zork1.bat -exit"
# ----------------------------------------------------------

# MacOS :^)
# ----------------------------------------------------------
# clean up stupid '._*' files that MacOS leaves around
alias dot_clean="find . -type f -name '._*' -delete"
# clean up swap files that MacOS leaves in the working directory (for some reason)
alias swp_clean="find . -type f -name '.*.swp' -delete"
# ----------------------------------------------------------

