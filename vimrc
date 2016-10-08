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
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'Shougo/neosnippet'
  Plugin 'Shougo/neosnippet-snippets'
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'joonty/vdebug.git'
  Plugin 'airblade/vim-rooter'

  Plugin 'Syntastic'
  Plugin 'Tabular'
  Plugin 'Tagbar'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'Gundo'

  " " zen writing
  Plugin 'junegunn/goyo.vim'

  " " themes
  Plugin 'tango.vim'
  Plugin 'chriskempson/base16-vim'

  " " language helpers/enhancements
  " Plugin 'StanAngeloff/php.vim'
  Plugin 'jtriley/vim-rst-headings'
  Plugin 'kovisoft/slimv'
  Plugin 'evidens/vim-twig'
  Plugin 'vim-php/tagbar-phpctags.vim'
  Plugin 'shawncplus/phpcomplete.vim'
  Plugin '2072/PHP-Indenting-for-VIm'
  Plugin 'elzr/vim-json'
  Plugin 'gavocanov/vim-js-indent'
  Plugin 'othree/yajs.vim'
  Plugin 'mxw/vim-jsx'
  Plugin 'mtscout6/syntastic-local-eslint.vim'
  Plugin 'smarty-syntax'
  Plugin 'tpope/vim-markdown'
  Plugin 'indentpython.vim'
  Plugin 'HTML5-Syntax-File'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

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
  set textwidth=72

  "enable comment text wrapping and comment leading
  set formatoptions=croq

  "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
  set completeopt=menu,menuone

" }

" Key Mappings {

  "The default leader is '\', but many people prefer ',' as it's in a standard
  "location
  let mapleader = "\<Space>"

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


  nnoremap <leader>f :UniteWithProjectDir file_rec/async <cr>
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

  nnoremap <leader>s :call AggregateSyntasticErrors()<CR>:Errors<CR>
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

  " NeoSnippets
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  imap <expr><C-k> (pumvisible()? "\<C-y>" : '') . "\<Plug>(neosnippet_expand_or_jump)"



  " SuperTab like snippets behavior.
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

  " JSHint
  let g:jshintprg="/usr/bin/jshint"

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

  " unite {
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#custom#profile('default', 'context', {
  \  'start_insert': 1,
  \   'winheight': 10,
  \   'direction': 'botright',
  \ })

  function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
  endfunction
  autocmd FileType unite call s:unite_settings()

  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='-i --vimgrep --hidden'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']


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

  " Syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_aggregate_errors = 0
    let g:syntastic_enable_signs = 0
    let g:syntastic_stl_format = "%E{E:%e}%W{ W:%w} (%F)"
    let g:syntastic_php_checkers = ['php', 'phpmd', 'phpcs']
    let g:syntastic_php_phpcs_args = '--standard='.$VIMHOME.'/Work/code-quality-configs/CodeSniffer/phpcs.xml'
    let g:syntastic_php_phpmd_post_args = $VIMHOME.'/Work/trulia/phpmd.xml'

    let g:syntastic_python_checkers = ['pyflakes']
    let g:syntastic_python_flake8_args='--ignore=E501,E225'

    let g:syntastic_rst_checkers = ['rstcheck']

    let g:syntastic_javascript_checkers = ['eslint']
    " let g:syntastic_javascript_eslint_exe = 'npm run lint:js -- '
    let g:syntastic_javascript_eslint_args = '--rule "no-var: 1"'

    function! AggregateSyntasticErrors()
      let g:syntastic_aggregate_errors = 1
      execute 'SyntasticCheck'
      let g:syntastic_aggregate_errors = 0
    endfunction
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

" Smarty Stuff {
augroup ft_html
  au!

  au BufNewFile,BufRead *.tpl setlocal filetype=smarty
  au FileType html setlocal spell
augroup end

" }

" es6 {
  let g:jsx_ext_required = 0 " allow jsx in .js
" }

augroup ft_python
  au!
  au BufRead,BufNewFile *.py,*pyw setlocal shiftwidth=4
  au BufRead,BufNewFile *py,*pyw setlocal tabstop=4
  au BufRead,BufNewFile *py,*pyw setlocal softtabstop=4
  au BufRead,BufNewFile *py,*pyw setlocal shiftround
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
  colorscheme base16-mocha


   set guioptions-=T            " remove the toolbar
   set guioptions-=l            " remove the left scrollbar
   set guioptions-=L            " remove the toolbar
   set guioptions-=r            " remove right scrollbar
   set guioptions-=R            " remove the toolbar
  " set guioptions-=m            " remove the toolbar

  if has("gui_macvim")
    set guifont=Source\ Code\ Pro:h15
  else
    set guifont=Monospace\ 11
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
