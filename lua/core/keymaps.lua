local g = vim.g

-- keymaps
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

g.mapleader = ','

-- Clear search highlight with <leader>c
map('n', '<leader>c', ':nohl<CR>')

-- Move around splits using C{h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Save with <leader>s
map('n', '<leader>s', ':w<CR>')
map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit with <leader>q
map('n', '<leader>q', ':qa!<CR>')

-- Insert date with <leader>d
map('n', '<leader>d', '!!date "+\\%Y-\\%m-\\%d \\%H:\\%M:\\%S"<CR>')


