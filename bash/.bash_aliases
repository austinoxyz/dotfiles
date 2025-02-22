# austinoxyz/.bash_aliases

alias la='ls -lAh --time-style=iso'
alias ll='ls -lh'

alias +x='chmod u+x'
alias :q='exit'
alias ..='cd ..'
alias vim='nvim'
alias nv='PATH=$PATH:$HOME/.config/nvim/lua/austino nvim'
alias ssha="eval "$(ssh-agent -s)""

if [ ! -z "${UTILITY}" ] && [ -d "${UTILITY}" ]; then
    alias fx="${UTILITY}/config-keyboard.sh"
    alias rw="${UTILITY}/random-wallpaper.sh"
    alias setmon="${UTILITY}/setup-monitors.sh"
    alias redon="${UTILITY}/redshift.sh"
fi

# specify history file when using `wget`
alias wget="wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts"

# clear nvim swap
alias clear-nvim-swap="rm -f ${XDG_STATE_HOME:-${HOME}/.local/state}/nvim/swap/%*"

# fast and clean make
alias mc="clear && make clean && make -j8"

# list process information from pids
alias lsps="ps -o pid,ppid,cmd,%cpu,%mem,etime -p"
# ----------------------------------------------------------

# Git
# ----------------------------------------------------------
alias gen-deploy-key="ssh-keygen -t ed25519 -C 'aodonnell2536.3@gmail.com'"
alias diff-last-commit='git diff >diff.diff && nv diff.diff'
alias gap='git add -p'
alias gg='git grep -n'
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

# Pacman
# ----------------------------------------------------------
# alias pacman-list-packages="pacman -Qqe"
# alias pacman-clear-orphans="sudo pacman -Rns \$(sudo pacman -Qdts)"
# ----------------------------------------------------------
