-- Space is my leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo.
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set('n', '<Leader>x', ':!xdg-open %<CR><CR>')

-- Move lines up and down. (Does not work atm, think 'A' for 'Alt' on windows is
-- kinda buggy on Mac)
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- Send all deletion to blackhole register
vim.keymap.set("n", "dd", '"_dd', opts)
vim.keymap.set("n", "D", '"_D', opts)
vim.keymap.set("n", "c", '"_c', opts)
vim.keymap.set("v", "c", '"_c', opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "x", '"_x', opts)

-- Lazygit
vim.keymap.set('n', '<Leader>g', ':LazyGit<CR>')

-- Map < and > to [ and ] for unimpaired.vim compatibility
vim.api.nvim_set_keymap('n', '<', '[', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '>', ']', { noremap = false, silent = true })
vim.api.nvim_set_keymap('o', '<', '[', { noremap = false, silent = true })
vim.api.nvim_set_keymap('o', '>', ']', { noremap = false, silent = true })
vim.api.nvim_set_keymap('x', '<', '[', { noremap = false, silent = true })
vim.api.nvim_set_keymap('x', '>', ']', { noremap = false, silent = true })
