"autocmd BufNewFild,BufRead *.vue setfiletype vue

" insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>
nnoremap <expr> gr ':Rgrep<CR>'
let g:go_fmt_command="goimports"
let g:netrw_alto = 1
let g:netrw_altv = 1
let g:netrw_keepdir=0
let g:netrw_banner = 0
let g:solarized_termcolors=256
let mapleader = "\<Space>"
nnoremap # *N 
nnoremap <leader>q :q!<cr>
nnoremap <leader>w :wa<cr>
nnoremap <leader>k :bd<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>n :Ex.<CR>

nnoremap j gj
nnoremap k gk
set showmatch
set matchtime=1
set matchpairs& matchpairs+=<:>
set autoread
set background=dark
set bs=start
set enc=utf8
set expandtab
set fenc=utf-8
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set isk+=-
set lazyredraw
set nobackup
set noswapfile
set number
set shiftwidth=2
set showcmd
set tabstop=2
set ttyfast
set updatetime=100
set visualbell
set wildmenu
set wildmode=full
set wrap
set nowrapscan

" オムニ補完の設定（insertモードでCtrl+oで候補を出す、Ctrl+n
" Ctrl+pで選択、Ctrl+yで確定）
set omnifunc=pythoncomplete#Complete
set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
set omnifunc=xmlcomplete#CompleteTags
set omnifunc=phpcomplete#CompletePHP

nmap <C-j><C-j> :nohlsearch<CR><Esc>
set laststatus=2 " ステータスラインを常に表示

let &statusline = ''
let &statusline .= '%t'
let &statusline .= '%='
let &statusline .= '[%{&l:fileencoding == "" ? &encoding : &l:fileencoding}%Y]' 
let &statusline .= ' %-5.(%l,%c%V%) %P'



call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'slim-template/vim-slim'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
call plug#end()


colorscheme  gruvbox
syntax enable
hi MatchParen cterm=bold ctermbg=239 ctermfg=177
hi Search ctermbg=177 ctermfg=239

" スペースの可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
