return {
  -- 1. GitHub Copilot (Ghost text inline completions)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true, -- Suggest text immediately as you type
          debounce = 75,
          keymap = {
            accept = "<M-l>", -- Press Option + l to accept completion (Mac Alt/Option key)
            accept_word = "<M-w>",
            accept_line = "<M-A-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  -- 2. CodeCompanion (The UI interface for Gemini chat/editing)
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",              -- Optional: for completion inside the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: for searching through prompts
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "gemini",
          },
          inline = {
            adapter = "gemini",
          },
        },
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              schema = {
                model = {
                  default = "gemini-2.5-flash", -- Quick, accurate, and cheap/free
                },
              },
            })
          end,
        },
      })

      -- Keymaps for Chat and AI actions
      vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionToggle<cr>", { desc = "Toggle AI Chat" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions Menu" })
      vim.keymap.set("v", "<leader>ce", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add selected text to AI Chat" })
    end,
  }
}
