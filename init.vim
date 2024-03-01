let mapleader = " "

" Install vundle
let shouldInstallBundles = 0

if !filereadable($HOME . "/.config/nvim/autoload/plug.vim")
  echo "~≥ Installing vim-plug \n"
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let shouldInstallBundles = 1
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
    " Themes
    Plug 'navarasu/onedark.nvim'
    Plug 'vim-airline/vim-airline-themes'

    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-tree/nvim-web-devicons'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Git
    Plug 'airblade/vim-gitgutter'

call plug#end()

colorscheme onedark

if shouldInstallBundles == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif

" Vim Config
filetype plugin on
filetype plugin indent on
syntax enable

" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=4
set tabstop=4

filetype plugin indent on
syntax on

set t_Co=256

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Mappings
nmap k gk
nmap j gj
map Q <Nop>
map K <Nop>

" Remap 'mistaken' presses...
inoremap jk <Esc>
inoremap kj <Esc>

command! Q q
command! Qa qa
command! W w
command! Wq wq
command! Qw wq

map q: :q

" Remap keys
nnoremap <leader>t :bnext<CR>
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" File browser
let NERDTreeShowHidden=1

" Narrow down the ctrlp functionallity to only the git files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Airline
let g:airline_theme='atomic'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" simple autocomplete
set cot=menu,menuone

ino <BS> <BS><C-r>=getline('.')[col('.')-3:col('.')-2]=~#'\k\k'?!pumvisible()?"\<lt>C-n>\<lt>C-p>":'':pumvisible()?"\<lt>C-y>":''<CR>
ino <CR> <C-r>=pumvisible()?"\<lt>C-y>":""<CR><CR>
ino <Tab> <C-r>=pumvisible()?"\<lt>C-n>":"\<lt>Tab>"<CR>
ino <S-Tab> <C-r>=pumvisible()?"\<lt>C-p>":"\<lt>S-Tab>"<CR>
augroup MyAutoComplete 
    au!
    au InsertCharPre * if
    \ !exists('s:complete') &&
    \ !pumvisible() &&
    \ getline('.')[col('.')-2].v:char =~# '\k\k' |
        \ let s:complete = 1 |
        \ noautocmd call feedkeys("\<C-n>\<C-p>", "nt") |
    \ endif
    au CompleteDone * if exists('s:complete') | unlet s:complete | endif
augroup END

