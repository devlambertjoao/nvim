return {
  {
    'nvim-lualine/lualine.nvim',
    event = { "VeryLazy" },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'codedark',
          -- component_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
              'WinEnter',
              'BufEnter',
              'BufWritePost',
              'SessionLoadPost',
              'FileChangedShellPost',
              'VimResized',
              'Filetype',
              'CursorMoved',
              'CursorMovedI',
              'ModeChanged',
            },
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }


      vim.cmd [[
        hi lualine_b_normal guibg=NONE
        hi lualine_b_insert guibg=NONE
        hi lualine_b_command guibg=NONE
        hi lualine_b_visual guibg=NONE
        hi lualine_b_replace guibg=NONE

        hi lualine_c_normal guibg=NONE
        hi lualine_c_insert guibg=NONE
        hi lualine_c_command guibg=NONE
        hi lualine_c_visual guibg=NONE
        hi lualine_c_replace guibg=NONE
      ]]
    end
  },
}
