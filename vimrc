""
"" Flamenless Vim Configuration
""
"" A .vimrc that uses VimPlug and borrows heavily from Janus.
""

""
"" Basic Setup
""
let mapleader = "\<Space>"  " Bring Space to your Leader
set number                  " Show line numbers
set ruler                   " Show line and column number
syntax enable               " Turn on syntax highlighting allowing local overrides
set wildmode=longest,list   " bash style tab completion

""
"" Identify Syntaxes
""
if has("autocmd")
  au BufRead,BufNewFile *.har set syntax=json filetype=json

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} setf markdown
  au FileType markdown setlocal wrap linebreak textwidth=72 nolist

  " Limit text width for wiki files
  au BufRead,BufNewFile *.wiki set textwidth=80

  " Detect nginx configurations
  au BufRead,BufNewFile */nginx/* set ft=nginx

  au BufRead,BufNewFile *.sshconfig set ft=sshconfig
endif

""
"" Spacing (Janus)
""
set nowrap                      " don't wrap lines
set tabstop=2                   " Set tabs to equal 2 spaces
set shiftwidth=2                " an autoindent (with <<) is two spaces
set softtabstop=2
set expandtab                   " use spaces, not tabs
set list                        " Show invisible characters
set backspace=indent,eol,start  " backspace through everything in insert mode
set nojoinspaces                " Insert only one space when joining lines that contain
                                " sentence-terminating punctuation like `.`.
" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set nofoldenable                " Don't fold code by default

" Make vim break lines without breaking words
" From http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

" Disable autoindentation (http://bit.ly/IQKws0)
nmap <silent> <leader>ii :setl noai nocin nosi inde=<CR>

""
"" Install plugins
"" See https://vimawesome.com for more
""
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'alunny/pegjs-vim'
  Plug 'ap/vim-css-color'
  Plug 'arthurxavierx/vim-caser'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'c9s/tinyurl.vim'
  Plug 'chr4/nginx.vim'
  Plug 'chrisbra/csv.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'cocopon/iceberg.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ervandew/supertab'
  Plug 'freitass/todo.txt-vim'
  Plug 'junegunn/goyo.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'majutsushi/tagbar'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'martinda/Jenkinsfile-vim-syntax'
  Plug 'mattn/gist-vim'
  Plug 'mattn/webapi-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'mileszs/ack.vim'
  Plug 'mmalecki/vim-node.js'
  Plug 'othree/html5.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'Raimondi/delimitMate'
  Plug 'rgarver/Kwbd.vim'
  Plug 'rhysd/devdocs.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'sh-dude/ZoomWin'
  Plug 'sjl/gundo.vim'
  Plug 'telamon/vim-color-github'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'thinca/vim-visualstar'
  Plug 'tommcdo/vim-fubitive'
  Plug 'tomtom/tlib_vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-pathogen'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-scripts/vimwiki'
  Plug 'w0rp/ale'
call plug#end()

""
"" Color
""
set t_Co=256 " Take advantage of 256 color terminal
set background=dark " Work in the dark
color iceberg

""
"" Searching (Janus)
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings (Janus)
""
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Disable temp and backup files
set wildignore+=*.swp,*~,._*
" Disable mac files
set wildignore+=.DS_Store

""
"" Backup and swap files (Janus)
""
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

""
"" DelimitMate
""
augroup plugin-delimitMate
  autocmd!
  " Configure better trip-tic behavior for markdown
  " Credit: https://github.com/Raimondi/delimitMate/issues/238#issuecomment-303674751
  au FileType markdown,gitcommit let b:delimitMate_expand_cr = 2
  au FileType markdown,gitcommit let b:delimitMate_expand_inside_quotes = 1
  au FileType markdown,gitcommit let b:delimitMate_expand_space = 0
  au FileType markdown,gitcommit let b:delimitMate_nesting_quotes = ['`']
augroup END

""
"" Fugitive (Janus)
""
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>

" Shortcut to load commit history in quickfix
nmap <leader>gl :Glog<CR>
vmap <leader>gl :Glog<CR>

" Shortcut browsing in the repo hosting provider
nmap <leader>gh :Gbrowse<CR>
vmap <leader>gh :Gbrowse<CR>

" Shortcut to push and force push
nmap <leader>gp :Git push<CR>
" TODO Avoid conflict with gf?
nmap <leader>gfp :Git push -f<CR>

" Shortcut for saving the current branch to origin
command GSetUpstream execute "Git push -u origin" FugitiveHead()
nmap <leader>gsu :GSetUpstream<CR>

" TODO how to get current branch name

let g:EditorConfig_exclude_patterns = ['fugitive://.*']  " Keep editor config from conflicting with fugitive
let g:gist_post_private = 1                              " Make private gists by default

""
"" Vimwiki
""
"" TODO fix template path for primary wiki
" Load vimwiki configuration
if filereadable(expand("~/.vimwikirc"))
  source ~/.vimwikirc
endif

""
"" CtrlP
""
" Use a git listing for ctrlp index when inside a repository
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -o --exclude-standard -c']
nmap <leader>pb :CtrlPBuffer<CR>

""
"" ALE
""
if glob('.eslintrc.*') != ''
  let g:ale_linters = { 'javascript': ['eslint','flow'], }
elseif glob('.prettierrc.js') != ''
  let g:ale_fixers = { 'javascript': ['prettier'], 'typescript': ['prettier'] }
  let g:ale_fix_on_save = 1
else
  let g:ale_linters = { 'javascript': ['standard','flow'], }
endif
let g:ale_javascript_standard_executable = 'semistandard'

map <unique> <Leader>ad  <Plug>(ale_go_to_definition)
map <unique> <Leader>af  <Plug>(ale_find_references)

""
"" Javascript
""
let g:javascript_plugin_jsdoc = 1    " Enable syntax highlighting for JSDocs
let g:vim_jsx_pretty_highlight_close_tag = 1 " Highlight the close tag separately from the open tag

" Map K to query devdocs for javascript files as per the devdocs README
augroup plugin-devdocs
  autocmd!
  autocmd FileType javascript,html nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END

" Add convenient command for formatting json
" Requires: https://stedolan.github.io/jq/
function! Jsonify()
  set filetype=json
  if executable("jq")
    %!jq '.'
  else
    echom "jq not installed"
  endif
endfunction
command! Jsonify :call Jsonify()

""
"" Ack
""
nmap <leader>f :Ack<space>
nmap <leader>ff :AckFromSearch

""
"" Uncategorized
""

" Y should logically yank to end of line
map Y y$

" Disable Ex mode shortcut
map Q <Nop>

" Clear the last used search pattern
command ClearSearch let @/ = ''
nmap <silent> <leader>hc :ClearSearch<CR>

" Shortcut common directory exploration commands
nmap <leader>ev :Vex<CR>
nmap <leader>es :Sex<CR>

" Open with
nmap <leader>oo :!open %<CR>

" Safely permit netrw to remove non-empty local directories
" Depends on https://hasseg.org/trash/ or
" https://github.com/andreafrancia/trash-cli
let g:netrw_localrmdir='trash'

" https://stackoverflow.com/a/1675752/199644
" Set up characters for displaying whitespace.
" Turn on with :set list. Off with :set nolist
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.
set nolist
