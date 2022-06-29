require('core/keymaps')

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>G', ':GFiles<CR>')
map('n', '<leader>f', ':Files<CR>')
map('n', '<leader>h', ':Files ~<CR>')
map('n', '<leader>b', ':Buffers<CR>')
map('n', '<leader>p', ':Windows<CR>')
map('n', '<leader>a', ':Ag<CR>')
map('n', '<leader>r', ':Rg<CR>')
