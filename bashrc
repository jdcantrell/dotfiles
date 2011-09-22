
PATH=/usr/local/bin:/usr/local/git/bin:$PATH

PS1="[\[\e[1;34m\]\h \[\e[0;34m\]\w\[\e[0m\]]\$ "

alias ls='ls -G'
alias socks='ssh -D 9999 john@oinos.homelinux.net'

#Useful functions
function g {
	grep "$@" ./* -Rno --color 
}

function vdc {
  a=`ls $1.* | sort -r | head -n 1`;
  b=`ls $1.* | sort -r | tail -n 1`;
  vimdiff $b $a;
}

#Trulia
alias fedev='ssh jcantrell@fedev.utah.trulia.com'
alias mount-dev='~/Projects/sshfs-binaries/sshfs jcantrell@fedev.utah.trulia.com:/home/jcantrell/public_html /Users/john/Projects/work'
