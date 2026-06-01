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
    opts = {},
  },
}
      -- The new standard entry point for setting up treesitter configurations
