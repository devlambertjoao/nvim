vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    local root_dir = vim.fs.dirname(
      vim.fs.find({ "package.json", ".git" }, { upward = true })[1]
    ) or vim.fn.getcwd()

    vim.lsp.start({
      name = "jsonls",
      cmd = { "vscode-json-language-server", "--stdio" },
      root_dir = root_dir,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(), -- opcional se estiver usando schemastore.nvim
          validate = { enable = true },
        },
      },
    })
  end,
})
