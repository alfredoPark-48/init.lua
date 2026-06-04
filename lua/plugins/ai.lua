return {
  -- 1. GitHub Copilot Engine (Fast inline ghost text completions as you type)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",        -- Option + l (macOS) / Alt + l (Linux) to accept completion
            accept_word = "<M-w>",   -- Option + w (macOS) / Alt + w (Linux) to accept next word
            accept_line = "<M-A-l>", -- Option + Shift + l (macOS) / Alt + Shift + l (Linux) for full line
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  -- 2. CodeCompanion (Configured to use Local Qwen via Ollama)
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "ollama", -- Point chat mechanics to your local machine
          },
          inline = {
            adapter = "ollama", -- Point inline refactoring changes to your local machine
          },
        },
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              schema = {
                model = {
                  default = "", -- Tell it to run your active local download
                },
              },
            })
          end,
        },
      })

      -- Core UI Actions and Controls
      vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle AI Chat Window" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "AI Context Actions Menu" })
      vim.keymap.set("v", "<leader>ce", "<cmd>CodeCompanionChat Add<cr>", { desc = "Send selection to Local Chat" })
    end,
  }
}
