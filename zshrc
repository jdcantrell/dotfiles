# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias fedev='ssh jcantrell@fedev.utah.trulia.com'
alias vim='~/Applications/MacVim.app/Contents/MacOS/Vim'
alias http-serve='python -m SimpleHTTPServer 40001'
export PATH="$HOME/.rbenv/bin:$PATH"
export CLICOLOR=1
eval "$(rbenv init - zsh)"

###begin-jump-bash_profile
function jump {
  local newDir=$(JUMPPROFILE=1 command jump "$@");
  cd "$newDir";
}
alias j="jump -a"
###end-jump-bash_profile
