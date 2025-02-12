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

  -- LSP Zero for easier setup of LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Mason (LSP installer)
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

  -- Ensure the correct LSP servers are installed via Mason
  require('mason-lspconfig').setup({
    ensure_installed = {
      "typescript-language-server", -- Correct for TypeScript
      "lua_ls",                     -- Lua
      "pyright",                    -- Python
      "gopls",                      -- Go
      "rust_analyzer",              -- Rust
      "html",                       -- HTML
      "cssls",                      -- CSS
      -- Add other language servers you need
    }
  })

  -- Setup LSP with lspconfig
  local lsp = require('lsp-zero')

  lsp.preset('recommended')

  lsp.ensure_installed({
    'lua_ls',        -- Lua
    'pyright',       -- Python
    'rust_analyzer', -- Rust
    'html',          -- HTML
    'cssls'          -- CSS
  })

  lsp.setup()

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
  use {
    "folke/trouble.nvim",
    cmd = "Trouble", -- Load on the command
    config = function()
      require("trouble").setup({})
    end
  }

  -- Web icons
  use 'nvim-tree/nvim-web-devicons'

  -- Copilot
  use "github/copilot.vim"

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
end)
