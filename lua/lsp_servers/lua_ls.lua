vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    local root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".luarc.json", ".luarc.jsonc", ".luacheckrc" }, { upward = true })[1])
      or vim.fn.getcwd()

    vim.lsp.start({
      name = "lua-language-server",
      cmd = { "lua-language-server" },
      root_dir = root_dir,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT", -- Neovim uses LuaJIT
          },
          diagnostics = {
            globals = { "vim" }, -- Prevent "vim" undefined warning
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
})
