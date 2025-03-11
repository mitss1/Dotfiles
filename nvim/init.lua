require('user/plugins')
require('user/options')
require('user/keymaps')

-- Disable spell checking for markdown files (including Obsidian notes)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "md" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
