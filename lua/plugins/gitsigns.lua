return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead' },
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = 'u' },
      },
      current_line_blame = true,
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      current_line_blame_opts = {
        delay = 10000,
      },
      numhl = true,
    })
  end
}
