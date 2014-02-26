"Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"   This is the personal .vimrc file of jd cantrell.
" }

" Environment {
  " Basics {
    set nocompatible     " must be first line
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
  " vim plugins
  Bundle 'gmarik/vundle'
  Bundle 'matchit.zip'
  Bundle 'ctrlp.vim'

  " themes
  Bundle 'tango.vim'
  Bundle 'molokai'
  Bundle 'Solarized'
  Bundle 'chriskempson/vim-tomorrow-theme'
  Bundle 'jdcantrell/colour-schemes', {'rtp': 'vim-themes/'}
  Bundle 'bling/vim-airline'

  " language helpers/enhancements
  Bundle 'Better-Javascript-Indentation'
  Bundle 'smarty-syntax'
  Bundle 'tpope/vim-liquid'
  Bundle 'tpope/vim-markdown'
  Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  Bundle 'pep8--Driessen'
  Bundle 'jshint.vim'
  Bundle 'Handlebars'
  " }
" }
" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
"
"
" General {
  filetype plugin indent on    " Automatically detect file types.
  syntax on           " syntax highlighting
  set mouse=a          " automatically enable mouse usage

  scriptencoding utf-8

  set modelines=5
  set shortmess+=filmnrxoOtT       " abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
  set virtualedit=onemore        " allow for cursor beyond last character
  set history=1000          " Store a ton of history (default is 20)
  set nospell           " spell checking off

  set mousehide
  set cmdheight=1

  set timeoutlen=500
  set undolevels=1000
  set visualbell
  set noerrorbells

  set synmaxcol=2048

  set hidden
  set lazyredraw

  "Disable matchparen plugin, since it slows things down when editing over the
  "network
  "let loaded_matchparen = 1

  " Keep the color syntax honest
  autocmd BufEnter * :syntax sync fromstart

  " Setting up the directories {
    set nobackup             " backups are nice not that nice...
    set noswapfile
    set nowritebackup

  " }
" }

" Vim UI {
  set tabpagemax=15             " only show 15 tabs
  set showmode                  " display the current mode
  set laststatus=2

  if has('cmdline_info')
    set ruler                    " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                  " show partial commands in status line and
  endif

  set backspace=indent,eol,start   " backspace for dummys
  set linespace=0         " No extra spaces between rows
  set nu                   " Line numbers on
  set showmatch            " show matching brackets/parenthesis
  set incsearch           " find as you type search
  set hlsearch             " highlight search terms
  set winminheight=0       " windows can be 0 line high
  set ignorecase           " case insensitive search
  set smartcase           " case sensitive when uc present
  set wildmenu             " show list instead of just completing
  set wildmode=list:longest,full   " comand <Tab> completion, list matches, then longest common part, then all.
  set whichwrap=b,s,h,l,<,>,[,]    " backspace and cursor keys wrap to
  set scrolljump=5         " lines to scroll when cursor leaves screen
  set scrolloff=3         " minimum lines to keep above and below cursor
" }

" Formatting {
  set nowrap               " done't wrap long lines
  set autoindent           " indent at the same level of the previous line
  set shiftwidth=2         " use indents of 4 spaces
  set tabstop=2           " an indentation every four columns
  set softtabstop=2
  set expandtab            " tabs are not tabs, they are spaces
  set smarttab

  set pastetoggle=<F12>    " pastetoggle (sane indentation on pastes)

  " disable textwrapping
  set textwidth=72

  "enable comment text wrapping and comment leading
  set formatoptions=croq

  "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

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

  " pageing
  nnoremap <Space> <C-d>
  nnoremap <S-Space> <C-u>

  " Make it easy to update and source _vimrc
  nmap <silent> ,ev :e $MYVIMRC<cr>
  nmap <silent> ,sv :so $MYVIMRC<cr>
  nmap <silent> ,bd :1,1000bd<cr>

  " change directory to current file (think 'use dir')
  nmap <leader>dd :cd %:p:h<cr>

  noremap ; :
  noremap j gj
  noremap k gk

  " clear whitespace
  nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
  " cut/paste to/from clipboard
  map <D-V> "+gP
  cmap <D-V> <C-R>+
  vnoremap <D-C> "+y

  cmap w!! w !sudo tee % >/dev/null


  " expand path on %%
  cabbr <expr> %% expand('%:p:h')

  " typos
  command! W w

  " easier quicklist movement
  nmap <leader>n :cn<CR>
  nmap <leader>N :cp<CR>

  " ,W strip whitespace
  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
  " ,S sort css tags
  nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>


" }

" Plugins {

  " JSHint
  let g:jshintprg="jshint"
  nmap <leader>h :JSHint<CR>
  "

  " Airline
    if has('gui_running')
      let g:airline_left_sep=''
      let g:airline_right_sep=''
    endif
  "

  " ctrlp {
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_by_filename = 1

    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPBuffer<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$',
        \ 'file': '\.exe$\|\.so$\|\.dll$' }
  "}"

  " Sparkup
    let g:sparkupExecuteMapping = '<D-e>'
  "

  " Command-T
    let g:CommandTMaxHeight = 10
  "

  " OmniComplete
    " Popup menu hightLight Group
    "highlight Pmenu   ctermbg=13   guibg=DarkBlue
    highlight PmenuSel   ctermbg=7   guibg=DarkBlue     guifg=LightBlue
    "highlight PmenuSbar ctermbg=7   guibg=DarkGray
    "highlight PmenuThumb       guibg=Black

    hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
    hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
    hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

    " some convenient mappings
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menu,preview,longest

  "
" }


" Diff Settings {
  set diffexpr=
  if &diff
    let &lines=50
    let &columns=200
  endif
" }

" Markdown Settings {
augroup ft_markdown
  au!

  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au FileType markdown setlocal formatoptions+=t
augroup end
" }

" Smarty Stuff {
augroup ft_html
  au!

  au BufNewFile,BufRead *.tpl setlocal filetype=smarty
augroup end
" }

" Remove trailing whitespaces and ^M chars
autocmd BufWritePre *  :%s/\s\+$//e

set background=light
if has('gui_running')
  colorscheme molokai

  set guioptions-=T            " remove the toolbar
  set guioptions-=l            " remove the toolbar
  set guioptions-=L            " remove the toolbar
  set guioptions-=r            " remove the toolbar
  set guioptions-=R            " remove the toolbar
  set guioptions-=m            " remove the toolbar

  if has("gui_macvim")
    set guifont=Menlo:h14
  else
    set guifont=Menlo\ 11
  endif

  "Remove all bells - this needs to be moved to .gvimrc
  set vb t_vb=

  "Highlight the status bar in terminals when going to/from insert mode
  "Commented out while we're using powerline
  "au InsertEnter * hi StatusLine guibg=#fafafa guifg=#718c00
  "au InsertLeave * hi StatusLine guibg=#fafafa guifg=#4271ae

else
  set term=$TERM
  set t_Co=256
  colorscheme tango
endif
