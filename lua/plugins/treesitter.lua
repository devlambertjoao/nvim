if os.getenv("NEOVIM_OS_RUNNING") == 'WINDOWS' then
  return {}
end

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
  },
  event = { 'VeryLazy' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'c',
        'lua',
        'c_sharp',
        'cpp',
        'css',
        'java',
        'javascript',
        'json',
        'make',
        'python',
        'ruby',
        'rust',
        'scss',
        'tsx',
        'vim',
        'vue',
        'yaml'
      },
      sync_install = false,
      auto_install = false,
      ignore_install = {},
      autotag = {
        enable = true,
        filetypes = {
          'html',
          'xml',
          'eruby',
          'embedded_template',
          'javascript',
          'typescript',
          'javascriptreact',
          'typescriptreact',
          'vue',
          'tsx'
        }
      },
      endwise = {
        enable = true,
      },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 75 * 1024 -- 75 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
    })
  end
}
