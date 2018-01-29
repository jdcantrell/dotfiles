# if not running interactively, don't do anything
[[ $- != *i* ]] && return

#set up our environment
HISTFILESIZE=5000
HISTSIZE=5000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
PATH="$HOME/.local/bin:$PATH"

export CLICOLOR=1
export EDITOR='vim'

#alias type things
alias http-serve='python -m SimpleHTTPServer 40001'
alias socks='ssh -D 9999'
alias phpsh='psysh'

function ssh-upload-key() {
  ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
}

#colors
reset=$(   tput sgr0 )
bold=$(    tput bold )
under=$(   tput smul )

# Unstyled colors
black=$(   tput setaf 0 || tput AF 0 )
red=$(     tput setaf 1 || tput AF 1 )
green=$(   tput setaf 2 || tput AF 2 )
yellow=$(  tput setaf 3 || tput AF 3 )
blue=$(    tput setaf 4 || tput AF 4 )
magenta=$( tput setaf 5 || tput AF 5 )
cyan=$(    tput setaf 6 || tput AF 6 )
white=$(   tput setaf 7 || tput AF 7 )

# Background colors (use with unstyled colors)
onblk=$(   tput setab 0 || tput AB 0 )
onred=$(   tput setab 1 || tput AB 1 )
ongrn=$(   tput setab 2 || tput AB 2 )
onylw=$(   tput setab 3 || tput AB 3 )
onblu=$(   tput setab 4 || tput AB 4 )
onmag=$(   tput setab 5 || tput AB 5 )
oncyn=$(   tput setab 6 || tput AB 6 )
onwht=$(   tput setab 7 || tput AB 7 )

# Normal colors
txtblk=$reset$black
txtred=$reset$red
txtgrn=$reset$green
txtylw=$reset$yellow
txtblu=$reset$blue
txtmag=$reset$magenta
txtcyn=$reset$cyan
txtwht=$reset$white

# Bold colors
bldblk=$bold$black
bldred=$bold$red
bldgrn=$bold$green
bldylw=$bold$yellow
bldblu=$bold$blue
bldmag=$bold$magenta
bldcyn=$bold$cyan
bldwht=$bold$white

# Underline colors
undblk=$under$black
undred=$under$red
undgrn=$under$green
undylw=$under$yellow
undblu=$under$blue
undmag=$under$magenta
undcyn=$under$cyan
undwht=$under$white

# Prompty things
GIT_BRANCH="\[$txtgrn\]"; #prefix branch name with a color
GIT_AHEAD="\[$bldgrn\]±"; #symbol for when we have unpushed commits
GIT_DIRTY="\[$bldylw\]"; #color for uncomitted changes

git_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo -n "${ref#refs/heads/} "
}

# Checks if working tree is dirty
git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    #dirty
    echo -n $GIT_DIRTY
  else
    #clean
    echo -n ""
  fi
}

# Checks if there are commits ahead from remote
git_ahead() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  if $(echo "$(git log origin/${ref#refs/heads/}..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo  -n $GIT_AHEAD
  fi
}

git_rebase() {
  if [ -d ".git/rebase-apply" ]; then
    echo -n "\[$txtmag\](rebase) "
  fi
}

PROMPT_HI="\[$bldblu\]";
PROMPT_LOW="\[$txtblu\]";

#if on a remote host list host name and change color
REMOTE_HOST="";
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  REMOTE_HOST="\[$bldgrn\]@\h ";
  PROMPT_HI="\[$bldgrn\]";
  PROMPT_LOW="\[$txtgrn\]";
fi

set_bash_prompt() {
  PS1="\[$reset\]$REMOTE_HOST$(git_ahead)$GIT_BRANCH$(git_dirty)$(git_rebase)$(git_info)$PROMPT_HI\W$PROMPT_LOW ➤ \[$reset\]"
}

PROMPT_COMMAND=set_bash_prompt

if [ -f ~/.bash.local ]; then
  source ~/.bash.local
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
