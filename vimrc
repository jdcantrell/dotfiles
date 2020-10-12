"Modeline and Notes {
"
"   This is the personal .vimrc file of jd cantrell.
" }

" Environment {
  " Basics {
    set nocompatible     " must be first line
    set pyx=3
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
  set rtp+=/usr/local/opt/fzf
  " Setup Bundle Support {
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
  " vim plugins
  Plugin 'gmarik/Vundle.vim'
  Plugin 'matchit.zip'
  Plugin 'ctrlpvim/ctrlp.vim'

  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'Shougo/defx.nvim'

  Plugin 'airblade/vim-rooter'
  Plugin 'mileszs/ack.vim'

  Plugin 'jamessan/vim-gnupg'

  Plugin 'w0rp/ale'
  Plugin 'Tagbar'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'sjl/gundo.vim'
  Plugin 'sandeepcr529/Buffet.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-eunuch'

  " " zen writing
  Plugin 'junegunn/goyo.vim'
  Plugin 'junegunn/vim-journal'
  Plugin 'junegunn/limelight.vim'
  Plugin 'junegunn/fzf.vim'

  " " themes
  Plugin 'tango.vim'
  Plugin 'chriskempson/base16-vim'
  Plugin 'morhetz/gruvbox'

  " " language helpers/enhancements
  Plugin 'jtriley/vim-rst-headings'
  Plugin 'tpope/vim-markdown'
  Plugin 'ap/vim-css-color'

  " lisp
  Plugin 'kovisoft/slimv'

  " python
  Plugin 'Vimjas/vim-python-pep8-indent'
  " Plugin 'davidhalter/jedi-vim'

  " php
  " Plugin 'evidens/vim-twig'
  " Plugin 'smarty-syntax'
  " Plugin 'StanAngeloff/php.vim'
  " Plugin 'shawncplus/phpcomplete.vim'
  " Plugin '2072/PHP-Indenting-for-VIm'

  " html/js
  Plugin 'othree/html5.vim'
  Plugin 'elzr/vim-json'
  Plugin 'pangloss/vim-javascript'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'MaxMEllon/vim-jsx-pretty'
  Plugin 'jparise/vim-graphql'

  Plugin 'dzeban/vim-log-syntax'

  " Plugin 'ryanoasis/vim-devicons'
  Plugin 'mhinz/vim-startify'

  call vundle#end()
 " }
 "}

" General {
  filetype plugin indent on    " Automatically detect file types.
  syntax on           " syntax highlighting
  " set mouse=a          " automatically enable mouse usage

  scriptencoding utf-8

  set nomodeline
  set modelines=5
  set shortmess+=filmnrxoOtT       " abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
  set foldlevel=20
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
  set textwidth=80

  "enable comment text wrapping and comment leading
  set formatoptions=croq

  "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
  set completeopt=menu,menuone

" }

" Key Mappings {

  "The default leader is '\', but many people prefer ',' as it's in a standard
  "location
  let mapleader = ","

  " Easier moving in tabs and windows
  "map <C-J> <C-W>j<C-W>_
  "map <C-K> <C-W>k<C-W>_
  "map <C-L> <C-W>l<C-W>_
  "map <C-H> <C-W>h<C-W>_
  "map <C-K> <C-W>k<C-W>_

  " The following two lines conflict with moving to top and bottom of the
  " screen
  " If you prefer that functionality, comment them out.
  "map <S-H> gT
  "map <S-L> gt

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  imap jj <Esc>

  " use left and right in normal mode to change buffers
  noremap <Left> :bp<cr>
  noremap <Right> :bn<cr>

  noremap <S-Left> :let &columns = &columns - 1<cr>
  noremap <S-Right> :let &columns = &columns + 1<cr>
  noremap <S-Up> :let &lines = &lines - 1<cr>
  noremap <S-Down> :let &lines = &lines + 1<cr>


  " pageing
  nnoremap <Space> <C-d>
  nnoremap <S-Space> <C-u>

  noremap j gj
  noremap k gk

  " clear whitespace
  nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
  " cut/paste to/from clipboard
  map <D-V> "+gP
  "map <C-V> "+gP
  cmap <D-V> <C-R>+
  vnoremap <D-C> "+y
  vnoremap <C-C> "+y

  cmap w!! w !sudo tee % >/dev/null



  " expand path on %%:
  cabbr <expr> %% expand('%:p:h')
  cabbr <expr> ww "~/Work/web"
  cabbr <expr> cc "~/Work/common"
  cabbr <expr> vt expand('%:p:h') . "/vendor/trulia"

  " Make it easy to update and source _vimrc
  nmap <silent> <leader>ev :e $MYVIMRC<cr>
  nmap <silent> <leader>sv :so $MYVIMRC<cr>
  nmap <silent> <leader>bd :bd <C-a><cr>

  " change directory to current file (think 'use dir')
  nmap <leader>dd :cd %:p:h<cr>
  nmap <leader>wd :cd ~/Work/web<cr>

  " Open file in stash
  nnoremap <leader>sc :exe ':silent !open -a firefox http://stash.sv2.trulia.com/projects/web/repos/common/browse/%:p:.'<cr>
  nnoremap <leader>sw :exe ':silent !open -a firefox http://stash.sv2.trulia.com/projects/web/repos/web/browse/%:p:.'<cr>

  "tabularize
  vnoremap <leader>A :Tabularize /=<cr>
  vnoremap <leader>a :Tabularize /=><cr>

  " typos
  command! W w

  " easier location list movement
  nmap <leader>lf :lfirst<CR>
  nmap <leader>ln :lnext<CR>
  nmap <leader>lp :lprev<CR>
  nmap <leader>ll :llast<CR>
  nmap <leader>lc :lclose<CR>


  nmap <leader>o :GFiles<CR>
  nmap <leader>t :TagbarToggle<CR>
  nmap <leader>b :Buffers<CR>
  nmap <leader>g :Rg<CR>
  nmap <leader>i :CtrlP<CR>
  nmap <leader>I :Files<CR>

  " This will temporarily set the cwd to the current file, display
  " errors, move to first error and then reset cwd to the original
  " This makes the location list show only the filename instead a large
  " relative path
  " ps h stands for hint as in jshint
  nmap <leader>h :let $rcwd=getcwd()<CR>:cd %:p:h<CR>:Errors<CR>:lfirst<CR>:cd $rcwd<CR>

  " nnoremap <leader>s :call AggregateSyntasticErrors()<CR>:Errors<CR>
  " ,W strip whitespace
  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

  vmap <leader>y "+y
  nmap <leader>p "+p

  nnoremap <Leader>w :w<CR>

" }

set omnifunc=syntaxcomplete#Complete
"

" Plugins {

  " Deoplete
  let g:deoplete#enable_at_startup = 1"
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


  " Airline
  " let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  "

  " ctrlp {
    let g:ctrlp_working_path_mode = 'ra'

    let g:ctrlp_use_caching = 0
     if executable('rg')
         set grepprg=rg\ --color=never

         let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
     else
       let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
       let g:ctrlp_prompt_mappings = {
         \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
         \ }
     endif
  " }


  " vim-rooter {
  let g:rooter_silent_chdir = 1
  " }


  " Ale {
     nmap <silent> <leader>n <Plug>(ale_next_wrap)
     " The space in front of the error and warning sign is a unicode em space
     " for some reason vim doesn't like a regular space when setting the sign characters
     let g:ale_sign_error = '-'
     let g:ale_sign_warning = '+'
     let g:ale_sign_info = '+'
     let g:ale_sign_column_always = 1
     let g:ale_lint_on_save = 1
     let g:ale_lint_on_text_changed = 'always'
     let g:ale_lint_delay = 750

     let g:ale_php_phpcs_standard = $VIMHOME.'/Work/code-quality-configs/CodeSniffer/phpcs.xml'
     let g:ale_php_phpmd_ruleset = $VIMHOME.'/Work/code-quality-configs/MessDetector/phpmd.xml'

     " let g:ale_linters = { 'html': ['htmlhint'], 'typescript': ['tslint', 'tsserver', 'typecheck'], }
     let g:ale_maximum_file_size = 60000

     let g:ale_fixers = {
           \ 'javascript': ['prettier'],
           \ 'javascript.jsx': ['prettier'],
           \ 'typescript': ['prettier'],
           \ 'typescript.tsx': ['prettier'],
           \ 'css': ['prettier'],
           \ 'html': ['prettier'],
           \ 'python': ['black'],
           \}
     " let g:ale_fixers = {
     "       \ 'javascript': [],
     "       \ 'javascript.jsx': [],
     "       \ 'typescript': [],
     "       \ 'typescript.tsx': [],
     "       \ 'css': [],
     "       \ 'python': ['black'],
     "       \}
     let g:ale_fix_on_save = 1
     let g:ale_javascript_prettier_options = ''
     let g:ale_exclude_highlights = []

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
  " }

  " Diff Settings {
    set diffexpr=
    if &diff
      let &lines=50
      let &columns=200
    endif
  " }

  " Gundo {
    let g:gundo_prefer_python3 = 1
  " }
  "

  " unite {
  "
    let g:unite_source_grep_command="rg"
    let g:unite_source_grep_default_opts="-i --nocolor --nogroup"

    nmap <silent> <leader>ag :execute 'Unite grep:'.getcwd()<cr>
  " }
  " Armor files
    let g:GPGPreferArmor=1
    let g:GPGDefaultRecipients=["jd@goodrobot.net"]

  " goyo {
  function! s:goyo_enter()
    let b:quitting = 0
    let b:quitting_bang = 0
    setlocal textwidth=78
    setlocal wm=2
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    Limelight
  endfunction

  function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
      if b:quitting_bang
        qa!
      else
        qa
      endif
    endif
    Limelight!
  endfunction



  autocmd! User GoyoEnter call <SID>goyo_enter()
  autocmd! User GoyoLeave call <SID>goyo_leave()
  " }


  " ack.vim {
  let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

  " Auto close the Quickfix list after pressing '<enter>' on a list item
  let g:ack_autoclose = 1

  " Any empty ack search will search for the work the cursor is on
  let g:ack_use_cword_for_empty_search = 1

  " Don't jump to first match
  cnoreabbrev Ack Ack!

  " Maps <leader>/ so we're ready to type the search keyword
  nnoremap <Leader>/ :Ack!<Space>
  " }

" }

augroup ft_markdown
  au!
  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au FileType markdown setlocal formatoptions+=t
augroup end

augroup ft_htmldjango
  au!
  au BufNewFile,BufRead *.j2 setlocal filetype=htmldjango
augroup end

augroup ft_python
   au!
   au Filetype python setlocal
         \ shiftwidth=4
         \ tabstop=4
         \ softtabstop=4
         \ shiftround
augroup end

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd setlocal spell
  autocmd FileType rst setlocal spell
  autocmd FileType text setlocal spell
  autocmd FileType text setlocal fo+=t
  autocmd FileType html setlocal spell
  autocmd FileType html.twig setlocal spell
augroup END

" typescriptreact -> typescript.tsx
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx


" Remove trailing whitespaces and ^M chars
autocmd BufWritePre *  :%s/\s\+$//e

set background=dark
if has('gui_running')

  map <S-Left> :set columns-=1<CR>
  map <S-Right> :set columns+=5<CR>
  map <S-Up> :set lines-=1<CR>
  map <S-Down> :set lines+=5<CR>

  set guioptions-=T            " remove the toolbar
  set guioptions-=l            " remove the left scrollbar
  set guioptions-=L            " remove the toolbar
  set guioptions-=r            " remove right scrollbar
  set guioptions-=R            " remove the toolbar
  " set guioptions-=m            " remove the toolbar

  if has("gui_macvim")
    " set guifont=MesloLGSNerdFontCompleteM-Regular:h16
    set guifont=JetBrainsMono-Light:h16
    cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>
  else
    set guifont=DejaVu\ Sans\ Mono\ Nerd\ Font\ 14
  endif

  "Remove all bells - this needs to be moved to .gvimrc
  set vb t_vb=

  colorscheme base16-snazzy
else
  set mouse=a
  if v:version < 800
    colorscheme tango
  else
    set termguicolors
    if &term =~# '^screen'
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    colorscheme base16-snazzy
  endif
endif
