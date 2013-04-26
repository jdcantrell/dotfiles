export PATH="$(brew --prefix josegonzalez/php/php54)/bin:/usr/local/share/npm/bin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"
export CLICOLOR=1
export EDITOR='vim'

alias fedev='ssh jcantrell@fedev.utah.trulia.com'
alias fedevdb='mysql -h fedevdb -u root -p'
#open file in existing vim from command line
alias http-serve='python -m SimpleHTTPServer 40001'
alias socks='ssh -D 9999'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

eval "$(rbenv init - )"

_git_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo -n "${ref#refs/heads/} "
}

# Checks if working tree is dirty
_git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    #dirty
    echo -n $GIT_DIRTY
  else
    #clean
    echo -n ""
  fi
}

# Checks if there are commits ahead from remote
_git_ahead() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  if $(echo "$(git log origin/${ref#refs/heads/}..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo  -n $GIT_AHEAD
  fi
}

PROMPT_HI="\[\e[1;34m\]";
PROMPT_LOW="\[\e[0;34m\]";
PROMPT_DEFAULT="\[\e[0m\]";
GIT_BRANCH="\[\e[0;32m\]";
GIT_AHEAD="\[\e[1;32m\]±";
GIT_DIRTY="\[\e[1;33m\]";

set_bash_prompt() {
  PS1="$(_git_ahead)$GIT_BRANCH$(_git_dirty)$(_git_info)$PROMPT_HI\W$PROMPT_LOW ➤ $PROMPT_DEFAULT"
}
PROMPT_COMMAND=set_bash_prompt
