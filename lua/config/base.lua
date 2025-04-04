vim.cmd([[
  
  set expandtab
  set smartindent
  set tabstop=2
  set shiftwidth=2
  
  set mouse=a
  
  set noshowmode
  set noshowcmd
  
  set relativenumber
  set number
  set signcolumn=yes:1
  
  set encoding=utf-8
  "set fileencoding=utf-8
  
  set pumheight=7
  
  set cursorline
  
  set noswapfile
  
  set updatetime=100
  
  set nowrap

  set background=dark
  set termguicolors
]])

-- Close quickfix list after jump
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<CR>", function()
      vim.cmd("execute 'cc' . line('.') | cclose")
    end, { buffer = true })
  end,
})
