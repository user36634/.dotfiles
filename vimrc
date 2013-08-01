" Initialize
set nocompatible
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set dir=~/.vim/backup
set clipboard+=unnamed

" Syntax
syntax enable

" Encoding
set encoding=utf-8

" Whitespace
" set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set expandtab
set autoindent
set smartindent
set smarttab
set list listchars=eol:\ ,tab:\ \ ,trail:·,extends:>,precedes:<
hi NonText ctermfg=7 guifg=gray

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,.hg,.bzr,.svn,*.pyc,*.rbc

" Status bar
set laststatus=2

" Functions
function s:setupWrapping()
  set wrap
  set wm=4
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" Autocmds
autocmd BufEnter * :syntax sync fromstart
if has("autocmd")
" Always autosave everything
"   au FocusLost * :wa
" Ignore warnings from untitled buffers
"   au FocusLost silent! :wa
" Remember last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
" Omnicompletion
  au FileType python set omnifunc=pythoncomplete#Complete
  au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  au FileType html set omnifunc=htmlcomplete#CompleteTags
  au FileType css set omnifunc=csscomplete#CompleteCSS
" Use real tabs
  au FileType make set noexpandtab
" Python PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set ts=4 sw=4 sta et sts=4 ai tw=79
" Less Highlighting
  au BufNewFile,BufRead *.less set filetype=less
endif

" Maps
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Lets
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Pathogen
call pathogen#runtime_append_all_bundles()

" CTags
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

" Color scheme
" let g:solarized_termcolors=256
let g:solarized_termtrans=1
" let g:solarized_degrade=1
" let g:solarized_bold=0
" let g:solarized_underline=0
" let g:solarized_italic=0
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
set background=dark
colorscheme solarized
" call togglebg#map("<F5>")
" colorscheme default
