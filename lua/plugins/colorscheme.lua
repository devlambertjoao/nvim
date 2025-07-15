return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi NvimTreeNormal guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi VertSplit guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE
      hi FloatBorder guibg=NONE
      hi TelescopeBorder guibg=NONE
      hi Pmenu guibg=NONE
      hi PmenuSel guibg=NONE
      hi StatusLine guibg=NONE
      hi StatusLineNC guibg=NONE
    ]]
      end,
    })


    vim.cmd([[ colorscheme rose-pine ]])
  end
}
