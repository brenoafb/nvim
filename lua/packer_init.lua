-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- fzf
  use {
    'junegunn/fzf',
    requires = { 'junegunn/fzf.vim' },
  }

  use {'nvim-orgmode/orgmode', config = function()
          require('orgmode').setup{}
  end
  }

  use 'hashivim/vim-terraform'

  use({
      'NTBBloodbath/doom-one.nvim',
      config = function()
          require('doom-one').setup({
              cursor_coloring = false,
              terminal_colors = false,
              italic_comments = false,
              enable_treesitter = true,
              transparent_background = false,
              pumblend = {
                  enable = true,
                  transparency_amount = 20,
              },
              plugins_integrations = {
                  neorg = true,
                  barbar = true,
                  bufferline = false,
                  gitgutter = false,
                  gitsigns = true,
                  telescope = false,
                  neogit = true,
                  nvim_tree = true,
                  dashboard = true,
                  startify = true,
                  whichkey = true,
                  indent_blankline = true,
                  vim_illuminate = true,
                  lspsaga = false,
              },
          })
      end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)
