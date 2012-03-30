#load zshuery
#git clone https://github.com/myfreeweb/zshuery.git
source $HOME/.zshuery/zshuery.sh
load_defaults
load_aliases
load_lol_aliases
load_completion $HOME/.zshuery/completion
load_correction

    #group_propt="$fg[red]%R →$reset_color $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "
zstyle ':completion:*' format "Completing $fg[blue]%d"
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' completer _complete _ignored _correct _approximate

# disable svn completion
compdef -d svn
#disable user listing
zstyle ':completion:*' users off

#update paths
export PATH="/usr/local/share/python:$HOME/.rbenv/bin:/usr/local/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"
export CLICOLOR=1

#rbenv
eval "$(rbenv init - zsh)"

#update editor
export EDITOR='vim'

function chpwd() {
    update_terminal_cwd
}

# make tab completion not so worthless when using cd:
zstyle ':completion:*:cd:*' tag-order local-directories named-directories

#enable vim mode
bindkey -v

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^R' history-incremental-search-backward

#aliases
alias fedev='ssh jcantrell@fedev.utah.trulia.com'
alias fedevdb='mysql -h fedevdb -u root -p'
alias vim='~/Applications/MacVim.app/Contents/MacOS/Vim'
alias http-serve='python -m SimpleHTTPServer 40001'
alias ls="ls -G"
alias socks='ssh -D 9999'

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

#Let me know when I am in vi mode
function zle-line-init zle-keymap-select {
    if [[ ${KEYMAP} == "vicmd" ]]; then
      RPROMPT="%{$bg_bold[green]%}%{$fg_bold[green]%} ~command~ %{$reset_color%}"
    else
      RPROMPT='%{$fg[$NCOLOR]%}%p %{$fg[green]%}$(git_prompt_ahead)$(git_prompt_info)%{$reset_color%}'
    fi
      zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#virtualenv helpers
function pyenv {
  if [ ! -d ~/.env/$1/ ]; then
    virtualenv ~/.env/$1 --no-site-packages
  fi
  source ~/.env/$1/bin/activate
}

#svn alias
surl="svn+ssh://svn/usr/local/svnrepos/TRULIA/FE/www/branches/"
export surl

function s {
  svn $1 svn+ssh://svn/usr/local/svnrepos/TRULIA/FE/www/branches/$2 $3
}

function sd {
  if [ -z "$1" ]
  then
    svn st | cut -c8- | sed -e '/local.conf/d' -e '/.htaccess/d' -e '/site.conf/d' | xargs svn diff | colordiff | less -R
  else
    svn diff "${@}" | colordiff
  fi
}
alias ss="svn st"

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

# Opens a new tab and starts guard in ~/FeDev and then returns to the
# previous tab
function watch-dev() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      do script with command "cd ~/FeDev/;guard; $*" in window 1
    end tell
    tell application "System Events"
      tell process "Terminal" to keystroke "{" using {command down}
    end
EOF
}


