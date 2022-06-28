call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'godlygeek/tabular'
Plug 'Pocco81/AutoSave.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif
set background=dark

autocmd VimEnter * COQnow --shut-up

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

set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

" VimWiki
let g:vimwiki_list = [{'path': '~/Sync/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_markdown_link_ext=1
" let g:markdown_folding=1
let g:vimwiki_folding="expr"
" fs = fsharp (not forth)
autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Tabs in go
au BufNewFile,BufRead *.go setlocal noet ts=2 sw=2 sts=2

" nvim lsp config
lua << EOF
require'lspconfig'.clangd.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.rls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.gopls.setup{}
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

" insert the current date
nnoremap <Leader>d "=strftime("%Y-%m-%d %T")<CR>P
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
