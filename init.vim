" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'neovimhaskell/haskell-vim'
Plug 'keith/swift.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'udalov/kotlin-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
" Initialize plugin system
"
call plug#end()

colorscheme nord

autocmd VimEnter * COQnow

syntax on
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

set number
set matchpairs+=<:> " use % to jump between pairs
" Visualize tabs
set listchars=tab:▸\

set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" Searching
set ignorecase
set smartcase

" The next line eliminates trailing whitespace
" autocmd BufWritePre * %s/\s\+$//e
" The problem is that it results in the cursos moving after writing the file.
" The solution is implemented as follows
" https://stackoverflow.com/a/37201230
function! <SID>StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" maps
let mapleader = ","
let maplocalleader = ","
nnoremap <space> za

" Reload config after editing
autocmd BufWritePost ~/.config/nvim/init.vim :source ~/.config/nvim/init.vim
" Goyo shortcut

" use system clipboard
set clipboard+=unnamedplus

" VimWiki
let g:vimwiki_list = [{'path': '~/Sync/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_markdown_link_ext=1
" let g:markdown_folding=1
let g:vimwiki_folding="expr"


set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" nvim lsp config
lua << EOF
require'lspconfig'.clangd.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.rls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.java_language_server.setup{}
EOF

" vim fzf config
map <leader>G :GFiles<CR>
map <leader>f :Files<CR>
map <leader>h :Files ~<CR>
map <leader>b :Buffers<CR>
map <leader>p :Windows<CR>
map <leader>a :Ag<CR>
map <leader>r :Rg<CR>

" goyo
map <leader>g :Goyo<CR>
