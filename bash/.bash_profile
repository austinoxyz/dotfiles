#
# ~/.bash_profile
#

[[ -f "${HOME-/home/austin}/.profile"  ]]  && source "${HOME-/home/austin}/.profile"
[[ -f "${HOME-/home/austin}/.bashrc" ]]    && source "${HOME-/home/austin}/.bashrc"
[[ -f "${HOME-/home/austin}/.cargo/env" ]] && source "${HOME-/home/austin}/.cargo/env"
