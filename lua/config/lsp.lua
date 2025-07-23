local function require_all_in(dir)
  local scan = vim.fs.dir
  local path = vim.fn.stdpath("config") .. "/lua/" .. dir:gsub("%.", "/")

  for name, type in scan(path) do
    if type == "file" and name:sub(-4) == ".lua" then
      local module = dir .. "." .. name:sub(1, -5) -- remove .lua extension
      require(module)
    end
  end
end

-- Load all LSP servers dynamically
require_all_in("lsp_servers")

-- Virtual Text Config
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  -- virtual_text = false,
  severity_sort = true,
  update_in_insert = true,
  float = {
    -- source = "always",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "e",
      [vim.diagnostic.severity.WARN] = "w",
      [vim.diagnostic.severity.HINT] = "h",
      [vim.diagnostic.severity.INFO] = "i",
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    -- local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- Code navigation
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>gk", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>gK", vim.lsp.buf.signature_help, opts)

    -- Code actions
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set("n", "<leader>cf", function()
    --   vim.lsp.buf.format({ async = true })
    --   print("native")
    -- end, opts)
    -- vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)

    -- Diagnostics
    vim.keymap.set("n", "<leader>da", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist, opts)
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>dn", function()
      vim.diagnostic.jump({ count = 1 })
    end, opts)

    -- Go to previous diagnostic
    vim.keymap.set("n", "<leader>dp", function()
      vim.diagnostic.jump({ count = -1 })
    end, opts)
  end,
})
