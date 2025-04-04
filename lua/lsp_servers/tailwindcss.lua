vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    local root_dir = vim.fs.dirname(
      vim.fs.find({ "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" }, { upward = true })[1]
    ) or vim.fn.getcwd()

    vim.lsp.start({
      name = "tailwindcss",
      cmd = { "tailwindcss-language-server", "--stdio" },
      root_dir = root_dir,
    })
  end,
})

