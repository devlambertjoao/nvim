vim.api.nvim_create_autocmd("FileType", {
  pattern = "css",
  callback = function()
    local root_dir = vim.fs.dirname(
      vim.fs.find({ "package.json", ".git" }, { upward = true })[1]
    ) or vim.fn.getcwd()

    vim.lsp.start({
      name = "cssls",
      cmd = { "vscode-css-language-server", "--stdio" },
      root_dir = root_dir,
      settings = {
        css = {
          validate = true,
        },
      },
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scss", "sass" },
  callback = function()
    local root_dir = vim.fs.dirname(
      vim.fs.find({ "package.json", ".git" }, { upward = true })[1]
    ) or vim.fn.getcwd()

    vim.lsp.start({
      name = "scssls",
      cmd = { "vscode-css-language-server", "--stdio" },
      root_dir = root_dir,
      settings = {
        scss = {
          validate = true,
        },
      },
    })
  end,
})
