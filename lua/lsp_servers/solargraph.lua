vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    local root_dir = vim.fs.dirname(
      vim.fs.find({ "Gemfile", ".git" }, { upward = true })[1]
    ) or vim.fn.getcwd()

    vim.lsp.start({
      name = "solargraph",
      cmd = { "solargraph", "stdio" },
      root_dir = root_dir,
      settings = {
        solargraph = {
          diagnostics = true,
          formatting = true,
        },
      },
    })
  end,
})
