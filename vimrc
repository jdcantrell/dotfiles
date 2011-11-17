" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" 	This is the personal .vimrc file of jd cantrell.
" }

" Environment {
	" Basics {
		set nocompatible 		" must be first line
	" }

	" Windows Compatible {
		" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
		" across (heterogeneous) systems easier. 
		if has('win32') || has('win64')
		  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		endif
	" }

  set ffs=unix,dos
	filetype off
	" Setup Bundle Support {
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
	Bundle 'gmarik/vundle'
	Bundle 'SuperTab-continued.'
	Bundle 'matchit.zip'
	Bundle 'molokai'
	Bundle 'minibufexpl.vim'
  Bundle 'jshint.vim'
  Bundle 'Better-Javascript-Indentation'
  Bundle 'Command-T'
  Bundle 'rstacruz/sparkup.git', {'rtp': 'vim/'}
	" }
" } 
	
" General {
	filetype plugin indent on  	" Automatically detect file types.
	syntax on 					" syntax highlighting
	set mouse=a					" automatically enable mouse usage

	scriptencoding utf-8

	set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
	set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
	set virtualedit=onemore 	   	" allow for cursor beyond last character
	set history=1000  				" Store a ton of history (default is 20)
	set nospell 					" spell checking off

  set mousehide
  set cmdheight=1

  set timeoutlen=500
  set undolevels=1000
  set visualbell
  set noerrorbells

  set synmaxcol=2048

  set hidden
  "set lazyredraw
	
  "Disable matchparen plugin, since it slows things down when editing over the
  "network
  let loaded_matchparen = 1  

  " Keep the color syntax honest
  autocmd BufEnter * :syntax sync fromstart

  "Highlight the status bar in terminals when going to/from insert mode
  au InsertEnter * hi StatusLine cterm=bold ctermfg=15 ctermbg=4
  au InsertLeave * hi StatusLine cterm=bold ctermfg=15 ctermbg=0

	" Setting up the directories {
		set nobackup 						" backups are nice not that nice...
		set noswapfile
		set nowritebackup
		
	" }
" }

" Vim UI { 
	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	if has('cmdline_info')
		set ruler                  	" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd                	" show partial commands in status line and
									" selected characters/lines in visual mode
	endif

	if has('statusline')
		set laststatus=2           	" show statusline only if there are > 1 windows
		" Use the commented line if fugitive isn't installed
        set statusline=%<%t\ %h%m%r[%{&ff}]%=%-14.(%l,%c%V%)\ %P
	endif

	set backspace=indent,eol,start 	" backspace for dummys
	set linespace=0 				" No extra spaces between rows
	set nu 							" Line numbers on
	set showmatch                  	" show matching brackets/parenthesis
	set incsearch 					" find as you type search
	set hlsearch 					" highlight search terms
	set winminheight=0 				" windows can be 0 line high 
	set ignorecase 					" case insensitive search
	set smartcase 					" case sensitive when uc present
	set wildmenu 					" show list instead of just completing
	set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
	set foldenable  				" auto fold code

" }

" Formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=2               	" use indents of 4 spaces
	set tabstop=2 					" an indentation every four columns
	set expandtab 	       		" tabs are tabs, not spaces
	"set matchpairs+=<:>            	" match, to be used with % 
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
	" Remove trailing whitespaces and ^M chars
	"autocmd FileType c,cpp,java,php,js,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key Mappings {

	"The default leader is '\', but many people prefer ',' as it's in a standard
	"location
	let mapleader = ','

	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_
	map <C-K> <C-W>k<C-W>_

	" The following two lines conflict with moving to top and bottom of the
	" screen
	" If you prefer that functionality, comment them out.
	map <S-H> gT          
	map <S-L> gt

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

  imap jj <Esc>

  " use left and right in normal mode to change buffers
  noremap <Left> :bp<cr>
  noremap <Right> :bn<cr>

  " Make it easy to update and source _vimrc
  nmap <silent> ,ev :e $MYVIMRC<cr>
  nmap <silent> ,sv :so $MYVIMRC<cr>
  noremap ; :
  noremap j gj
  noremap k gk

  " cut/paste to/from clipboard
  map <D-V> "+gP
  cmap <D-V> <C-R>+
  vnoremap <D-C> "+y

  cmap w!! w !sudo tee % >/dev/null

  " expand path on %%
  cabbr <expr> %% expand('%:p:h')


" }

" Plugins {

	" Supertab {
		let g:SuperTabDefaultCompletionType = "context"
		let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"
		let g:SuperTabCrMapping = 0
	" }

  " Sparkup {
    let g:sparkupExecuteMapping = '<D-e>'
  "

  " Command-T {
    let g:CommandTMaxHeight = 10
  " }

	" OmniComplete {
		"if has("autocmd") && exists("+omnifunc")
			"autocmd Filetype *
				"\if &omnifunc == "" |
				"\setlocal omnifunc=syntaxcomplete#Complete |
				"\endif
		"endif

		" Popup menu hightLight Group
		"highlight Pmenu 	ctermbg=13 	guibg=DarkBlue
		highlight PmenuSel 	ctermbg=7 	guibg=DarkBlue 		guifg=LightBlue
		"highlight PmenuSbar ctermbg=7 	guibg=DarkGray
		"highlight PmenuThumb 			guibg=Black

		hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
		hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
		hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

		" some convenient mappings 
		"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
		inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
		inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
		inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
		inoremap <expr> <C-d> 	   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
		inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

		" automatically open and close the popup menu / preview window
		au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
		set completeopt=menu,preview,longest
	" }
	
	" Ctags {
		"set tags=./tags;/,~/.vimtags
	" }

	" EasyTags {
		"let g:easytags_cmd = '/usr/local/bin/ctags'
	" }


" }

" GUI Settings {
	" GVIM- (here instead of .gvimrc)
	if has('gui_running')
		set guioptions-=T          	" remove the toolbar
		set guifont=Menlo:h14
    "Remove all bells - this needs to be moved to .gvimrc
    set vb t_vb=

		"set transparency=5          " Make the window slightly transparent

    "minibuf options
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
    let g:miniBufExplorerMoreThanOne = 0
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplMapWindowNavVim = 1
	else
		set term=builtin_ansi       " Make arrow and other keys work
	endif
" }

" Diff Settings {
  set diffexpr=
  if &diff
    let &lines=50
    let &columns=200
  endif
" }

" Python Settings {
  autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,exc
  autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" }

" Markdown Settings {
  autocmd BufRead *.markdown set textwidth=80
  autocmd BufRead *.md set textwidth=80
  autocmd BufRead *.md set syntax=markdown
" }

	if has('gui_running')
	  colorscheme molokai     	       		" load a colorscheme
  else
    set term=$TERM
    set t_Co=256
    colorscheme molokai
  endif
