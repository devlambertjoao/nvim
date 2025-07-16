return {
  {
    "akinsho/bufferline.nvim",
    event = { "VeryLazy" },
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          numbers = 'ordinal',
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end
        },
        highlights = {
          fill = {
            bg = 'NONE'
          }
        }
      })

      vim.cmd [[
        hi BufferLineFill guibg=NONE
        hi BufferLineBackground guibg=NONE
        hi BufferLineSeparator guibg=NONE
        hi BufferLineSeparatorSelected guibg=NONE
        hi BufferLineSeparatorVisible guibg=NONE
        hi BufferLineTab guibg=NONE
        hi BufferLineTabSelected guibg=NONE
        hi BufferLineTabClose guibg=NONE
        hi BufferLineCloseButton guibg=NONE
        hi BufferLineCloseButtonVisible guibg=NONE
        hi BufferLineCloseButtonSelected guibg=NONE

        nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
        nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
        nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
        nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
        nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
        nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
        nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
        nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
        nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
        nnoremap <silent><leader>bn <Cmd>bnext<CR>
        nnoremap <silent><leader>bp <Cmd>bprevious<CR>
      ]]
    end,
  }
}
