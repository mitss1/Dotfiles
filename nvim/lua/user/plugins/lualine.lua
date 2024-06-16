local separator = { '"▏"', color = 'none' }

require('lualine').setup({
  options = {
    section_separators = '',
    component_separators = '',
    globalstatus = true,
    theme = {
      normal = {
        a = { fg = '#ffffff', bg = 'none' },
        b = { fg = '#ffffff', bg = 'none' },
        c = { fg = '#ffffff', bg = 'none' },
      },
      insert = {
        a = { fg = '#ffffff', bg = 'none' },
        b = { fg = '#ffffff', bg = 'none' },
        c = { fg = '#ffffff', bg = 'none' },
      },
      visual = {
        a = { fg = '#ffffff', bg = 'none' },
        b = { fg = '#ffffff', bg = 'none' },
        c = { fg = '#ffffff', bg = 'none' },
      },
      replace = {
        a = { fg = '#ffffff', bg = 'none' },
        b = { fg = '#ffffff', bg = 'none' },
        c = { fg = '#ffffff', bg = 'none' },
      },
      command = {
        a = { fg = '#ffffff', bg = 'none' },
        b = { fg = '#ffffff', bg = 'none' },
        c = { fg = '#ffffff', bg = 'none' },
      },
      inactive = {
        a = { fg = '#ffffff', bg = 'none' },
        b = { fg = '#ffffff', bg = 'none' },
        c = { fg = '#ffffff', bg = 'none' },
      },
    },
  },
  sections = {
    lualine_a = {
      'mode',
      separator,
    },
    lualine_b = {
      'branch',
      'diff',
      separator,
      '"🖧  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
      separator,
    },
    lualine_c = {
      'filename'
    },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      separator,
      '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
      separator,
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
})
