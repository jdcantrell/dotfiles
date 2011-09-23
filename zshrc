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

function dev-setup {
  #update .htaccess
  DIR=${1-${PWD##*/}}
  USER=${2-jcantrell}
  sed -i '' -e 's/^RewriteBase/#RewriteBase/' .htaccess
  sed -i '' -e "s/^#RewriteBase \/~roger/RewriteBase \/~$USER/" .htaccess
  sed -i '' -e "s/cobrand_merge/$DIR/" .htaccess
  sed -i '' -e "s/roger/$USER/" .htaccess

  #update local.conf
  sed -i '' -e "s/\/\* BEGIN USER SETTINGS//" include/local.conf

  #update site.conf
  sed -i '' -e "s/base_path=%URI_PATH%/base_path=/" config/site.conf
  sed -i '' -e "s/%TPL_PATH%/\/home\/$USER\/public_html\/$DIR\/cobrand\/sofia\/templates\//" config/site.conf
  sed -i '' -e "s/%URI_PATH%/\/~$USER\/$DIR\//"  config/site.conf
}

function dev-clone {
  BRANCH=${1}
  DIR=${2}
  USER=${3-jcantrell}
  
  #svn pull
  svn co svn+ssh://svn/usr/local/svnrepos/TRULIA/FE/www/branches/$BRANCH $DIR

  #update guardfile
  sed -i '' -e '$d' Guardfile
  echo "  watch( %r{^$DIR} ) { \`rsync -avm ./$DIR/ jcantrell@fedev.utah.trulia.com:/home/jcantrell/public_html/$DIR/ --exclude '.svn'\` }" >> Guardfile
  echo "end" >> GuardFile

  #dev-setup
  cd $DIR
  dev-setup $DIR
  cd ..
}
