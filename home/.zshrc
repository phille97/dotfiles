#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

unsetopt correct
unsetopt correct_all

# configure for gnupg ssh agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi


# Herre, visa mig dina vägar, lär mig dina stigar.
export GOPATH="~/go/"
export PATH="~/.yarn/bin:~/go/bin:$PATH"

# Omvänd er och låt er alla döpas i Jesu Kristi namn
alias gst="git status"
alias say='echo "$1" | espeak -s 120 2>>/dev/null'

# Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Python virtualenvs
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Fix stuff for autocompletion
autoload -U +X bashcompinit && bashcompinit
