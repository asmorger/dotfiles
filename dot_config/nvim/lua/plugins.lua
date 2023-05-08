vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'sainnhe/gruvbox-material'
  use 'tribela/vim-transparent'

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
    end
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup { keys = 'tnseriaoplfuwyq;dhc,x.z' }
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'kdheepak/lazygit.nvim'

  use {
    "projekt0n/circles.nvim",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("circles").setup()
    end
  }

  use 'nvim-tree/nvim-tree.lua'

  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
    end,
  }
end)
