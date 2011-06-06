PS1='[\[\e[1;34m\]\h \[\e[0;34m\]\w\[\e[0m\]]\$ '

#Aliases I like to use when on the run...
alias ls='ls -G'
alias socks='ssh -D 9999 john@oinos.homelinux.net'

#Useful functions
function g {
	grep "$@" ./* -Rno --color 
}
