
-- autocmds
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '200' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Automatically format go files
autocmd('BufWritePre', {
  pattern = '*.go',
  command = 'lua vim.lsp.buf.formatting_sync()'
})


-- Automatically format TF files
autocmd('BufWritePre', {
  pattern = '*.tf',
  command = 'lua vim.lsp.buf.formatting_sync()'
})

