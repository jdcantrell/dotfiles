"Modeline and Notes {
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

  let $VIMHOME=expand('<sfile>:p:h')

  set ffs=unix,dos
  filetype off
  " Setup Bundle Support {
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
  " vim plugins
  Plugin 'gmarik/Vundle.vim'
  Plugin 'matchit.zip'
  Plugin 'ctrlp.vim'
  if v:version > 703
    Plugin 'Shougo/neocomplete.vim'
  else
    Plugin 'Shougo/neocomplcache.vim'
  endif
  Plugin 'Syntastic'
  Plugin 'Tabular'
  Plugin 'Tagbar'
  Plugin 'bling/vim-airline'
  Plugin 'mrtazz/simplenote.vim'

  " themes
  Plugin 'tango.vim'
  Plugin 'Solarized'
  Plugin 'chriskempson/base16-vim'

  " language helpers/enhancements
  Plugin 'Better-Javascript-Indentation'
  Plugin 'smarty-syntax'
  Plugin 'tpope/vim-markdown'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  call vundle#end()
 " }
 "}

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

  set autoread " auto reload unmodified files that have been changed

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
  cabbr <expr> ww "~/Trulia/web"
  cabbr <expr> cc "~/Trulia/common"
  cabbr <expr> txl "~/Trulia/oocss"

  " Make it easy to update and source _vimrc
  nmap <silent> <leader>ev :e $MYVIMRC<cr>
  nmap <silent> <leader>sv :so $MYVIMRC<cr>
  nmap <silent> <leader>bd :1,1000bd<cr>

  " change directory to current file (think 'use dir')
  nmap <leader>dd :cd %:p:h<cr>
  nmap <leader>ww :cd ~/Trulia/web<cr>
  nmap <leader>cc :cd ~/Trulia/common<cr>

  " Open file in stash
  nnoremap <leader>sc :exe ':silent !open -a firefox http://stash.sv2.trulia.com/projects/web/repos/common/browse/%:p:.'<cr>
  nnoremap <leader>sw :exe ':silent !open -a firefox http://stash.sv2.trulia.com/projects/web/repos/web/browse/%:p:.'<cr>

  "tabularize
  vnoremap <leader>A :Tabularize /=<cr>
  vnoremap <leader>a :Tabularize /=><cr>

  " typos
  command! W w

  " easier location list movement
  nmap <leader>N :lfirst<CR>
  nmap <leader>n :lnext<CR>
  nmap <leader>m :lprev<CR>
  nmap <leader>M :llast<CR>
  nmap <leader>H :lclose<CR>


  nmap <leader>f :CtrlP<CR>
  nmap <leader>t :CtrlPTag<CR>
  nmap <leader>T :TagbarToggle<CR>

  " This will temporarily set the cwd to the current file, display
  " errors, move to first error and then reset cwd to the original
  " This makes the location list show only the filename instead a large
  " relative path
  " ps h stands for hint as in jshint
  nmap <leader>h :let $rcwd=getcwd()<CR>:cd %:p:h<CR>:Errors<CR>:lfirst<CR>:cd $rcwd<CR>

  " ,W strip whitespace
  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
  " ,S sort css tags
  nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>


" }

" Plugins {

  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " JSHint
  let g:jshintprg="jshint"

  "

  " Airline
    if has('gui_running')
      let g:airline_left_sep=''
      let g:airline_right_sep=''
      let g:airline#extensions#tagbar#enabled = 0
    endif
  "

  " ctrlp {
    let g:ctrlp_working_path_mode = 'ra'

    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$|vendor',
        \ 'file': '\.exe$\|\.so$\|\.dll$' }
  " }

  " Sparkup
    let g:sparkupExecuteMapping = '<D-e>'
  "

  " Command-T
    let g:CommandTMaxHeight = 10
  "
  "
  " SimpleNote
  if filereadable(expand("~/.simplenoterc"))
    source ~/.simplenoterc
  endif

  " Syntastic {
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_enable_signs = 0
    let g:syntastic_stl_format = "%E{E:%e}%W{ W:%w} (%F)"
    let g:syntastic_php_checkers = ['php', 'phpmd', 'phpcs']
    let g:syntastic_php_phpcs_args = '--standard='.$VIMHOME.'/.phpcs.xml'
    let g:syntastic_php_phpmd_post_args = $VIMHOME.'/.phpmd.xml'
  " }
  " OmniComplete
    " Popup menu hightLight Group
    "highlight Pmenu   ctermbg=13   guibg=DarkBlue
    highlight PmenuSel   ctermbg=7   guibg=DarkBlue     guifg=LightBlue
    "highlight PmenuSbar ctermbg=7   guibg=DarkGray
    "highlight PmenuThumb       guibg=Black

    hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
    hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
    hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
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
  au FileType markdown setlocal spell
  au FileType markdown nested NeoCompleteLock
augroup end
" }

" Smarty Stuff {
augroup ft_html
  au!

  au BufNewFile,BufRead *.tpl setlocal filetype=smarty
augroup end
" }
"
"
"
" Python {
augroup ft_python
  au!
  au FileType python set shiftwidth=2
augroup end
" }

" Remove trailing whitespaces and ^M chars
autocmd BufWritePre *  :%s/\s\+$//e

set background=dark
if has('gui_running')
  colorscheme base16-monokai


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
