return {
  -- Automatically adds matching brackets, parens, and quotation marks
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Smart commenting. Type 'gcc' to comment a line, or 'gc' over a visual selection
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      local ft = require("Comment.ft")
      local old_calculate = ft.calculate
      ft.calculate = function(ctx)
        local ok, parser = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
        if not ok or not parser then
          return ft.get(vim.bo.filetype, ctx.ctype)
        end
        return old_calculate(ctx)
      end
      require("Comment").setup({})
    end,
  },
}
      -- The new standard entry point for setting up treesitter configurations
