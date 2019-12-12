" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'junegunn/goyo.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'neovimhaskell/haskell-vim'
Plug 'chrisbra/Colorizer'
Plug 'jceb/vim-orgmode'
Plug 'alx741/vim-hindent'

" Initialize plugin system
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


set number relativenumber
set matchpairs+=<:> " use % to jump between pairs
" Visualize tabs
set listchars=tab:▸\

set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
autocmd BufWritePre * %s/\s\+$//e

" maps
let mapleader = ","
nnoremap <space> za

" Searching
nnoremap / /\v
vnoremap / /\v

" Reload config after editing
autocmd BufWritePost ~/.config/nvim/init.vim :source ~/.config/nvim/init.vim
" Goyo shortcut
map <leader>f :Goyo \| set linebreak<CR>

" Open NerdTree
map <leader>t :NERDTreeToggle<CR>

" use system clipboard
set clipboard+=unnamedplus

" VimOrg
let g:org_agenda_files=['~/Dropbox/org/index.org']

