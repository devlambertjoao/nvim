vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    local root_dir = vim.fs.dirname(
      vim.fs.find({ "index.html", "package.json", ".git" }, { upward = true })[1]
    ) or vim.fn.getcwd()

    vim.lsp.start({
      name = "html",
      cmd = { "vscode-html-language-server", "--stdio" },
      root_dir = root_dir,
    })
  end,
})

