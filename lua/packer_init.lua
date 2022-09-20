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

  -- snippets
  use "rafamadriz/friendly-snippets"

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

  use 'tpope/vim-fugitive'

  use({
      'NTBBloodbath/doom-one.nvim',
      setup = function()
          -- Add color to cursor
  		vim.g.doom_one_cursor_coloring = false
  		-- Set :terminal colors
  		vim.g.doom_one_terminal_colors = true
  		-- Enable italic comments
  		vim.g.doom_one_italic_comments = false
  		-- Enable TS support
  		vim.g.doom_one_enable_treesitter = true
  		-- Color whole diagnostic text or only underline
          vim.g.doom_one_diagnostics_text_color = false
  		-- Enable transparent background
  		vim.g.doom_one_transparent_background = false

          -- Pumblend transparency
  		vim.g.doom_one_pumblend_enable = false
  		vim.g.doom_one_pumblend_transparency = 20

          -- Plugins integration
  		vim.g.doom_one_plugin_neorg = true
  		vim.g.doom_one_plugin_barbar = false
  		vim.g.doom_one_plugin_telescope = false
  		vim.g.doom_one_plugin_neogit = true
  		vim.g.doom_one_plugin_nvim_tree = true
  		vim.g.doom_one_plugin_dashboard = true
  		vim.g.doom_one_plugin_startify = true
  		vim.g.doom_one_plugin_whichkey = true
  		vim.g.doom_one_plugin_indent_blankline = true
  		vim.g.doom_one_plugin_vim_illuminate = true
  		vim.g.doom_one_plugin_lspsaga = false
  	end,
  	config = function()
          vim.cmd("colorscheme doom-one")
      end,
  })

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)
