local opt = vim.opt

opt.expandtab = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2

opt.relativenumber = true
opt.number = true
opt.signcolumn = 'yes:1'

opt.showmode = false

opt.encoding = 'utf-8'

opt.cursorline = true
opt.wrap = true

opt.swapfile = false
opt.writebackup = false
opt.backup = false

opt.updatetime = 100
opt.autoread = true
opt.ttyfast = true
opt.lazyredraw = true

-- Recarrega o buffer se outro processo alterar o arquivo no disco
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose", "TermLeave" }, {
  group = vim.api.nvim_create_augroup("auto_reload", { clear = true }),
  callback = function()
    if vim.fn.getcmdwintype() == "" and vim.bo.buftype == "" then
      vim.cmd("checktime")
    end
  end,
})

opt.background = 'dark'
opt.termguicolors = true

opt.clipboard = "unnamedplus"
