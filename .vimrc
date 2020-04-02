" insert mode
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
nnoremap <C-h> ^
nnoremap <C-l> $
noremap <silent> <ESC><ESC> :noh<CR>
" 改行を挿入してコマンドモードを維持 https://vim-jp.org/vim-users-jp/2009/08/15/Hack-57.html
nnoremap <C-o> :<C-u>call append(expand('.'), '')<Cr>j

"virtualモードの時にスターで選択位置のコードを検索するようにする"
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

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
set conceallevel=0

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

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('wadackel/vim-dogrun')
  call dein#add('slim-template/vim-slim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('fatih/vim-go')
  call dein#add('tpope/vim-fugitive')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('previm/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" let g:deoplete#enable_at_startup = 1
let g:vim_markdown_folding_disabled = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
filetype plugin indent on
syntax enable
colorscheme dogrun

hi MatchParen cterm=bold ctermbg=239 ctermfg=177
hi Search ctermbg=177 ctermfg=239

" スペースの可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
