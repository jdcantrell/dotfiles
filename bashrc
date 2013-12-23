#set up our environment
export CLICOLOR=1
export EDITOR='vim'

if [ -f ~/.bash.local ]; then
  source ~/.bash.local
fi

#virtualenv
export WORKON_HOME="~/.envs"
source /usr/local/bin/virtualenvwrapper.sh

#alias type things
alias http-serve='python -m SimpleHTTPServer 40001'
alias socks='ssh -D 9999'

# Prompty things
GIT_BRANCH="\[\e[0;32m\]"; #prefix branch name with a color
GIT_AHEAD="\[\e[1;32m\]±"; #symbol for when we have unpushed commits
GIT_DIRTY="\[\e[1;33m\]"; #color for uncomitted changes

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

#if on a remote host list host name and change color
REMOTE_HOST="";
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  REMOTE_HOST="\[\e[1;32m\]@\h ";
  PROMPT_HI="\[\e[1;32m\]";
  PROMPT_LOW="\[\e[0;32m\]";
fi

set_bash_prompt() {
  PS1="$REMOTE_HOST$(_git_ahead)$GIT_BRANCH$(_git_dirty)$(_git_info)$PROMPT_HI\W$PROMPT_LOW ➤ $PROMPT_DEFAULT"
}

PROMPT_COMMAND=set_bash_prompt
