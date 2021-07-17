" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dense-analysis/ale'
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'
Plug 'neovimhaskell/haskell-vim'
Plug 'keith/swift.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Initialize plugin system
"
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

syntax on

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

" Open NerdTree
map <leader>t :NERDTreeToggle<CR>

" use system clipboard
set clipboard+=unnamedplus

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_markdown_link_ext=1

set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Space vim dark theme settings
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" ALE config

" Optional, configure as-you-type completions
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

let g:ale_linters = {'haskell': ['hlint'], 'elixir': ['elixir-ls']}

let g:ale_fixers = {'haskell': ['hlint'], 'elixir': ['mix-format']}

" Required, tell ALE where to find Elixir LS
let g:ale_elixir_elixir_ls_release = expand("~/Documents/elixir-ls/rel")

" Optional, you can disable Dialyzer with this setting
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}

let g:ale_fix_on_save = 1

nnoremap dt :ALEGoToDefinition<cr>
nnoremap df :ALEFix<cr>
nnoremap K :ALEHover<cr>

" vim fzf config
map <leader>g :GFiles<CR>
map <leader>p :Files<CR>
map <leader>h :Files ~<CR>
map <leader>b :Buffers<CR>
map <leader>w :Windows<CR>
