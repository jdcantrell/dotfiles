# if not running interactively, don't do anything
[[ $- != *i* ]] && return

export GPG_TTY=$(tty)

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

function ssh-upload-key() {
  ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
}

eval "$(starship init bash)"

if [ -f ~/.bash.local ]; then
  source ~/.bash.local
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
