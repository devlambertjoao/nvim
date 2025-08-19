return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.cmd [[
          ""hi Normal guibg=NONE ctermbg=NONE
          ""hi NormalNC guibg=NONE ctermbg=NONE
          ""hi NvimTreeNormal guibg=NONE ctermbg=NONE
          ""hi SignColumn guibg=NONE ctermbg=NONE
          ""hi VertSplit guibg=NONE ctermbg=NONE
          ""hi EndOfBuffer guibg=NONE ctermbg=NONE
          ""hi NormalFloat guibg=NONE
          ""hi FloatBorder guibg=NONE
          ""hi TelescopeBorder guibg=NONE
          ""hi Pmenu guibg=NONE
          ""hi PmenuSel guibg=NONE
          ""hi StatusLine guibg=NONE
          ""hi StatusLineNC guibg=NONE


          ""hi BufferLineFill guibg=NONE
          ""hi BufferLineBackground guibg=NONE
          ""hi BufferLineSeparator guibg=NONE
          ""hi BufferLineSeparatorSelected guibg=NONE
          ""hi BufferLineSeparatorVisible guibg=NONE
          ""hi BufferLineTab guibg=NONE
          ""hi BufferLineTabSelected guibg=NONE
          ""hi BufferLineTabClose guibg=NONE
          ""hi BufferLineCloseButton guibg=NONE
          ""hi BufferLineCloseButtonVisible guibg=NONE
          ""hi BufferLineCloseButtonSelected guibg=NONE
        ]]
      end,
    })

    local theme = require('onedark')
    theme.setup({
      style = 'darker'
    })
    theme.load()


    -- vim.cmd([[ colorscheme  ]])
  end
}
