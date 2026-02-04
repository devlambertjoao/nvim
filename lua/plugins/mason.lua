return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim"
    },
    event = { "VeryLazy" },
    config = function()
      local manson = require("mason")
      manson.setup({
        ui = {
          icons = {
            package_installed = "+",
            package_pending = "~",
            package_uninstalled = "-",
          },
        },
      })

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        automatic_installation = false,
        ensure_installed = {
          "lua_ls",      -- Lua
          -- "solargraph", -- Ruby
          "jsonls",      -- JSON
          "html",        -- HTML
          "ts_ls",       -- Typescript
          "tailwindcss", -- Tailwindcss
          "cssls",       -- CSS, SCSS, SASS,
          -- "rust_analyzer", -- Rust
          -- "clangd", -- C
          -- "pyright", -- Python
          -- "bashls",      -- Bash
        },
      })
    end,
  },
}
