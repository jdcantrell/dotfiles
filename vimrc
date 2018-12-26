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
  set rtp+=~/usr/local/opt/fzf
  call vundle#begin()
  " vim plugins
  Plugin 'gmarik/Vundle.vim'
  Plugin 'matchit.zip'
  Plugin 'ctrlp.vim'
  Plugin 'junegunn/fzf.vim'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'Shougo/neosnippet'
  Plugin 'Shougo/neosnippet-snippets'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'joonty/vdebug.git'
  Plugin 'airblade/vim-rooter'
  Plugin 'vim-scripts/Rename'

  Plugin 'w0rp/ale'
  Plugin 'Tagbar'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'Gundo'

  " " zen writing
  Plugin 'junegunn/goyo.vim'
  Plugin 'mrtazz/simplenote.vim'

  " " themes
  Plugin 'tango.vim'
  Plugin 'chriskempson/base16-vim'
  Plugin 'morhetz/gruvbox'

  " " language helpers/enhancements
  Plugin 'jtriley/vim-rst-headings'
  Plugin 'tpope/vim-markdown'

  " lisp
  Plugin 'kovisoft/slimv'

  " python
  Plugin 'Vimjas/vim-python-pep8-indent'
  Plugin 'davidhalter/jedi-vim'

  " php
  Plugin 'evidens/vim-twig'
  Plugin 'smarty-syntax'
  Plugin 'StanAngeloff/php.vim'
  Plugin 'shawncplus/phpcomplete.vim'
  Plugin '2072/PHP-Indenting-for-VIm'

  " html/js
  Plugin 'othree/html5.vim'
  Plugin 'elzr/vim-json'
  Plugin 'gavocanov/vim-js-indent'
  Plugin 'othree/yajs.vim'
  Plugin 'mxw/vim-jsx'
  Plugin 'benjie/local-npm-bin.vim'


  " typescript
  " Plugin 'Quramy/tsuquyomi'
  " Plugin 'HerringtonDarkholme/yats.vim'

  Plugin 'dzeban/vim-log-syntax'

  call vundle#end()
 " }
 "}

" General {
  filetype plugin indent on    " Automatically detect file types.
  syntax on           " syntax highlighting
  " set mouse=a          " automatically enable mouse usage

  scriptencoding utf-8

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


  nmap <leader>o :CtrlP<CR>
  nmap <leader>vs :CtrlP ./vendor/trulia/search-core<CR>
  nmap <leader>vc :CtrlP ./vendor/trulia/web-common<CR>
  nmap <leader>vt :CtrlP ./vendor/trulia/
  nmap <leader>t :TagbarToggle<CR>
  nmap <leader>b :Bufferlist<CR>

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

  " Neocomplete
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplete#max_list = 10

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " remove spell check words
  let g:neocomplcache_disabled_sources_list = {'_' : ['dictionary_complete']}

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  " inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " Enable heavy omni completion.
  "if !exists('g:neocomplete#sources#omni#input_patterns')
    "let g:neocomplete#sources#omni#input_patterns = {}
  "endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

  " JSHint
  let g:jshintprg="/usr/bin/jshint"

  "

  " Airline
  " let g:airline#extensions#ale#enabled = 1
    if has('gui_running')
      let g:airline_left_sep=''
      let g:airline_right_sep=''
      let g:airline#extensions#tagbar#enabled = 0
    endif
  "

  " ctrlp {
    let g:ctrlp_working_path_mode = 'ra'

    let g:ctrlp_use_caching = 0
     if executable('ag')
         set grepprg=ag\ --nogroup\ --nocolor

         let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
     else
       let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
       let g:ctrlp_prompt_mappings = {
         \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
         \ }
     endif
  " }

  "pdv
  let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
  nnoremap <leader>c :call pdv#DocumentWithSnip()<CR>


  " Sparkup
    let g:sparkupExecuteMapping = '<D-e>'
  "

  " vim-rooter {
  let g:rooter_silent_chdir = 1
  " }

  " vdebug {
    let g:vdebug_options = {'ide_key': 'netbeans-xdebug'}
    let g:vdebug_options = {'break_on_open': 0}
    let g:vdebug_options = {'server': 'fedev.sv2.trulia.com'}
    let g:vdebug_options = {'port': '9000'}
    let g:vdebug_options['path_maps'] = {'/Users/jcantrell/Trulia': '/home/jcantrell/public_html'}
  " }

  " Ale {
     nmap <silent> <leader>n <Plug>(ale_next_wrap)
     " The space in front of the error and warning sign is a unicode em space
     " for some reason vim doesn't like a regular space when setting the sign characters
     let g:ale_sign_error = ' ✖'
     let g:ale_sign_warning = ' ➤'
     let g:ale_sign_info = '🛈'
     let g:ale_sign_column_always = 1
     let g:ale_lint_on_save = 1
     let g:ale_lint_on_text_changed = 'always'
     let g:ale_lint_delay = 750

     let g:ale_php_phpcs_standard = $VIMHOME.'/Work/code-quality-configs/CodeSniffer/phpcs.xml'
     let g:ale_php_phpmd_ruleset = $VIMHOME.'/Work/code-quality-configs/MessDetector/phpmd.xml'
     let g:ale_javascript_eslint_executable = 'npm run eslint'
     let g:ale_javascript_eslint_options = '--rule "no-var: 1"'

     let g:ale_linters = { 'html': ['htmlhint'], 'typescript': ['tslint', 'tsserver', 'typecheck'], }
     let g:ale_maximum_file_size = 60000

     let g:ale_pattern_options = { '.*static/js/.*\.js$': {'ale_enabled': 0}, '.*_built/.*\.js$': {'ale_enabled': 0} }

     let g:ale_fixers = {}
     let g:ale_fixers['javascript'] = ['prettier']
     let g:ale_fix_on_save = 1
     let g:ale_javascript_prettier_options = '--single-quote --trailing-comma'
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

" Markdown Settings {
augroup ft_markdown
  au!

  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au FileType markdown setlocal formatoptions+=t
  au FileType markdown setlocal spell
  "au FileType markdown nested NeoCompleteLock
augroup end
" }

" Simplenote {
  source ~/.simplenoterc
  let g:SimplenoteFiletype = 'markdown'
" }

" Smarty Stuff {
augroup ft_html
  au!

  au BufNewFile,BufRead *.tpl setlocal filetype=smarty
  au FileType html setlocal spell
augroup end

" es6 {
  let g:jsx_ext_required = 0 " allow jsx in .js
" }

augroup ft_python
  au!
  au BufRead,BufNewFile * setlocal shiftwidth=4
  au BufRead,BufNewFile * setlocal tabstop=4
  au BufRead,BufNewFile * setlocal softtabstop=4
  au BufRead,BufNewFile * setlocal shiftround
augroup end

let php_sql_query = 0
let php_html_load = 0

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
  autocmd FileType html setlocal spell
  autocmd FileType html.twig setlocal spell
augroup END

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
    set guifont=Source\ Code\ Pro:h16
  else
    set guifont=Monospace\ 13
  endif

  "Remove all bells - this needs to be moved to .gvimrc
  set vb t_vb=

  colorscheme base16-unikitty-dark
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
    colorscheme gruvbox
  endif
endif

