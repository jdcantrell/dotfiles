#load zshuery
#git clone https://github.com/myfreeweb/zshuery.git
source $HOME/.zshuery/zshuery.sh
load_defaults
load_aliases
load_lol_aliases
load_completion $HOME/.zshuery/completion
load_correction

# disable svn completion
compdef -d svn

#update editor
if [[ $IS_MAC -eq 1 ]]; then
    export EDITOR='mvim'
else
    export EDITOR='vim'
fi

function chpwd() {
    update_terminal_cwd
}

#git stuff simplified from oh-my-zsh
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "git:${ref#refs/heads/}$(git_dirty)"
}

# Checks if working tree is dirty
function git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    #dirty
    echo "%{$fg[red]%}✗"
  else
    #clean
    echo ""
  fi
}

# Checks if there are commits ahead from remote
function git_prompt_ahead() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  if $(echo "$(git log origin/${ref#refs/heads/}..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "%{$fg_bold[green]%}+"
  fi
}

#set up prompt
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="blue"; fi
prompts '%{$fg[$NCOLOR]%}%c %{$fg_bold[blue]%}➤ %{$reset_color%}' '%{$fg[$NCOLOR]%}%p %{$fg[green]%}$(git_prompt_ahead)$(git_prompt_info)%{$reset_color%}'

#virtualenv helpers
function pyenv {
  source ~/.env/$1/bin/activate
}

function pyenv-new {
  virtualenv ~/.env/$1 $2 $3 $4
}

#svn alias
function s {
  svn $1 svn+ssh://svn/usr/local/svnrepos/TRULIA/FE/www/branches/$2 $3
}
function sd {
  svn diff "${@}" | colordiff
}

function sdv {
  svn diff "${@}" | view -
}

function sdaily {
  DATE1=${2-`date -v-1d "+%Y-%m-%d"`}
  DATE2=${3-`date "+%Y-%m-%d"`}
  USER=${1-jcantrell}
  echo "svn log for $DATE1 to $DATE2 for $USER:"
  svn log -r{$DATE1}:{$DATE2} | grep $USER -A 2 | sed -e '/^[-]*$/d' -e 's/ .* line$/ /' | sed -e '$!N;s/\n/- /' 
}

function stoday {
  sdaily ${1-jcantrell} `date "+%Y-%m-%d"` `date -v+1d "+%Y-%m-%d"`
}
