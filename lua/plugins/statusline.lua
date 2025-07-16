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

        hi lualine_b_diff_added guibg=NONE
        hi lualine_b_diff_added_insert guibg=NONE
        hi lualine_b_diff_added_normal guibg=NONE
        hi lualine_b_diff_added_visual guibg=NONE
        hi lualine_b_diff_added_command guibg=NONE
        hi lualine_b_diff_added_replace guibg=NONE
        hi lualine_b_diff_added_terminal guibg=NONE
        hi lualine_b_diff_added_inactive guibg=NONE
        
        hi lualine_b_diff_modified guibg=NONE
        hi lualine_b_diff_modified_insert guibg=NONE
        hi lualine_b_diff_modified_normal guibg=NONE
        hi lualine_b_diff_modified_visual guibg=NONE
        hi lualine_b_diff_modified_command guibg=NONE
        hi lualine_b_diff_modified_replace guibg=NONE
        hi lualine_b_diff_modified_terminal guibg=NONE
        hi lualine_b_diff_modified_inactive guibg=NONE
        
        hi lualine_b_diff_removed guibg=NONE
        hi lualine_b_diff_removed_insert guibg=NONE
        hi lualine_b_diff_removed_normal guibg=NONE
        hi lualine_b_diff_removed_visual guibg=NONE
        hi lualine_b_diff_removed_command guibg=NONE
        hi lualine_b_diff_removed_replace guibg=NONE
        hi lualine_b_diff_removed_terminal guibg=NONE
        hi lualine_b_diff_removed_inactive guibg=NONE

        hi lualine_b_diagnostics_hint_insert guibg=NONE
        hi lualine_b_diagnostics_hint_normal guibg=NONE
        hi lualine_b_diagnostics_hint_visual guibg=NONE
        hi lualine_b_diagnostics_hint_command guibg=NONE
        hi lualine_b_diagnostics_hint_replace guibg=NONE
        hi lualine_b_diagnostics_hint_terminal guibg=NONE
        hi lualine_b_diagnostics_hint_inactive guibg=NONE
        
        hi lualine_b_diagnostics_info_insert guibg=NONE
        hi lualine_b_diagnostics_info_normal guibg=NONE
        hi lualine_b_diagnostics_info_visual guibg=NONE
        hi lualine_b_diagnostics_info_command guibg=NONE
        hi lualine_b_diagnostics_info_replace guibg=NONE
        hi lualine_b_diagnostics_info_terminal guibg=NONE
        hi lualine_b_diagnostics_info_inactive guibg=NONE
        
        hi lualine_b_diagnostics_warn_insert guibg=NONE
        hi lualine_b_diagnostics_warn_normal guibg=NONE
        hi lualine_b_diagnostics_warn_visual guibg=NONE
        hi lualine_b_diagnostics_warn_command guibg=NONE
        hi lualine_b_diagnostics_warn_replace guibg=NONE
        hi lualine_b_diagnostics_warn_terminal guibg=NONE
        hi lualine_b_diagnostics_warn_inactive guibg=NONE
        
        hi lualine_b_diagnostics_error_insert guibg=NONE
        hi lualine_b_diagnostics_error_normal guibg=NONE
        hi lualine_b_diagnostics_error_visual guibg=NONE
        hi lualine_b_diagnostics_error_command guibg=NONE
        hi lualine_b_diagnostics_error_replace guibg=NONE
        hi lualine_b_diagnostics_error_terminal guibg=NONE
        hi lualine_b_diagnostics_error_inactive guibg=NONE

        

        hi lualine_c_normal guibg=NONE
        hi lualine_c_insert guibg=NONE
        hi lualine_c_command guibg=NONE
        hi lualine_c_visual guibg=NONE
        hi lualine_c_replace guibg=NONE
      ]]
    end
  },
}
