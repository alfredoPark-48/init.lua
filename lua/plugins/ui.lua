return {
  -- Modern, highly-customizable colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Forces this plugin to load first during startup
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- Sleek statusline at the bottom of the screen
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = "|",
        section_separators = "",
      },
    },
  },
}
