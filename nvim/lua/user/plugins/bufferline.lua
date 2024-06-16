require('bufferline').setup({
  options = {
    indicator = {
      icon = ' ',
    },
    show_close_icon = false,
    tab_size = 0,
    max_name_length = 25,
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        highlight = 'StatusLine',
        text_align = 'left',
      },
    },
    separator_style = 'thin',
    modified_icon = '',
    custom_areas = {
      left = function()
        return {
          { text = '    ', fg = '#8fff6d' },
        }
      end,
    },
  },
  highlights = {
    fill = {
      bg = 'none',
    },
    background = {
      bg = 'none',
    },
    tab = {
      bg = 'none',
    },
    tab_close = {
      bg = 'none',
    },
    close_button = {
      bg = 'none',
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    close_button_visible = {
      bg = 'none',
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    close_button_selected = {
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    buffer_visible = {
      bg = 'none',
    },
    modified = {
      bg = 'none',
    },
    modified_visible = {
      bg = 'none',
    },
    duplicate = {
      bg = 'none',
    },
    duplicate_visible = {
      bg = 'none',
    },
    separator = {
      fg = 'none',
      bg = 'none',
    },
    separator_selected = {
      fg = 'none',
      bg = 'none',
    },
    separator_visible = {
      fg = 'none',
      bg = 'none',
    },
  },
})
