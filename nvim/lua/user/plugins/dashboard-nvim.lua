require('dashboard').setup {
  theme = 'hyper',
  config = {
    header = {
      '',
      '',
      '███╗   ███╗',
      '████╗ ████║',
      '██╔████╔██║',
      '██║╚██╔╝██║',
      '██║ ╚═╝ ██║',
      '╚═╝     ╚═╝',
      '',
    },
    shortcut = {
      { icon = ' ', desc = 'New file', group = 'DashboardShortcut', action = 'enew', key = 'n' },
      { icon = ' ', desc = 'Find file', group = 'DashboardShortcut', action = 'Telescope find_files', key = 'f' },
      { icon = '󰌍 ', desc = 'Recent files', group = 'DashboardShortcut', action = 'Telescope oldfiles', key = 'r' },
      { icon = '󰮗 ', desc = 'Find Word', group = 'DashboardShortcut', action = 'Telescope live_grep', key = 'g' },
    },
    footer = {}
  }
}

-- Highlight groups for rose-pine theme
vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#f9b5ac' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#73A7A7' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#FFAE8F' })