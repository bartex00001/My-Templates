let mapleader = " "

" Install vundle
let shouldInstallBundles = 0


" Vim Plug
if !filereadable($HOME . "/.config/nvim/autoload/plug.vim")
  echo "~≥ Installing vim-plug \n"
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let shouldInstallBundles = 1
endif

call plug#begin('~/.config/nvim/plugged')
    " Themes
    Plug 'navarasu/onedark.nvim'

    " Telescope and dependencies
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
call plug#end()


" Setup Lua Packages via packer
lua require('plugins')
lua require('nvim_comment').setup()


colorscheme rose-pine
set t_Co=256


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


" Telescope Remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Setup BufferTab
nnoremap <leader>t  <cmd>tabNext<CR>
nnoremap <leader>at <cmd>tabnew<CR>
nnoremap <leader>ct <cmd>tabclose<CR>
