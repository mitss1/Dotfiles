local db = require('dashboard')
db.setup {
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
      { icon = ' ', desc = 'New file ', action = 'enew' },
      { icon = ' ', key = 'SPC ff', desc = 'Find file ', action = 'Telescope find_files' },
      { icon = '󰌍 ', key = 'SPC fh', desc = 'Recent files ', action = 'Telescope oldfiles' },
      { icon = '󰮗 ', key = 'SPC fg', desc = 'Find Word ', action = 'Telescope live_grep' },
    },
    footer = {}
  }
}

vim.cmd([[
augroup DashboardHighlights
  autocmd ColorScheme * highlight DashboardHeader guifg=#f9b5ac
  autocmd ColorScheme * highlight DashboardCenter guifg=#9876AA
  autocmd ColorScheme * highlight DashboardShortcut guifg=#73A7A7
  autocmd ColorScheme * highlight DashboardFooter guifg=#FFAE8F
augroup end
]])
vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#f9b5ac' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#9876AA' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#73A7A7' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#FFAE8F' })
