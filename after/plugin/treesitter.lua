require("nvim-treesitter.install").prefer_git = true

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "markdown", "javascript", "typescript", "python", "rust", "c", "lua", "vim", "vimdoc", "query" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
  },

  autotag = {
      enable = true,
  }
}
