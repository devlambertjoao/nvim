return {
  {
    "stevearc/conform.nvim",
    event = { "VeryLazy" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd", "prettier", "eslint_d" },
          javascriptreact = { "prettierd", "prettier", "eslint_d" },
          typescript = { "prettierd", "prettier", "eslint_d" },
          typescriptreact = { "prettier", "eslint_d" },
          css = { "prettierd", "prettier" },
          scss = { "prettierd", "prettier" },
        },
      })

      vim.keymap.set("n", "<leader>cf", function()
        conform.format({ async = true, lsp_format = true })
        -- print("conform")
      end, { desc = "Format file" })
    end,
  },
}
