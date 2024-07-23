vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- Harpoon
  use 'theprimeagen/harpoon'

  -- Undotree
  use 'mbbill/undotree'

  -- Fugitive
  use 'tpope/vim-fugitive'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Mason
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Git blame
  use 'f-person/git-blame.nvim'

  -- Smooth scrolling
  use 'karb94/neoscroll.nvim'

  -- Autocompletion
  use 'SirVer/ultisnips'
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
      'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
      'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
      'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
    }
  }

  -- One Dark Pro
  use "olimorris/onedarkpro.nvim"

  --- Nvim Tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- Git signs
  use { "lewis6991/gitsigns.nvim",
    config = function() require('gitsigns').setup() end
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Autoformatter
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
      vim.cmd('autocmd BufWritePre * lua require("conform").format()')
    end,
  })

  -- Error lens
  use 'folke/trouble.nvim'

  -- Copilot
  use "github/copilot.vim"

  -- CopilotChat
  use { "CopilotC-Nvim/CopilotChat.nvim", config = function() require("CopilotChat").setup() end }

  -- CopilotC-Nvim and dependencies
  use {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    requires = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require('CopilotChat').setup({
        debug = true,
        mappings = {
          complete = {
            insert = '',
          },
        },
      })
      if pcall(require, 'cmp') then
        require("CopilotChat.integrations.cmp").setup()
      end
    end
  }

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = {
        "markdown" }
    end,
    ft = { "markdown" },
  })
end)
