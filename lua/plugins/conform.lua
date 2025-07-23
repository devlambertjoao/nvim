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
        if conform.will_format then
          conform.format({ async = true })
        else
          vim.lsp.buf.format({ async = true })
        end
      end)
    end,
  },
}
