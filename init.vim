" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/goyo.vim'
Plug 'dense-analysis/ale'
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'
Plug 'neovimhaskell/haskell-vim'
Plug 'keith/swift.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'junegunn/vim-emoji'
" Initialize plugin system
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


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
map <leader>g :Goyo \| set linebreak<CR>

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

" Emoji
set completefunc=emoji#complete

