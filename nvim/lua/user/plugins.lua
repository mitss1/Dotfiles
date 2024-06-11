local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

-- Packer can manage itself.
use('wbthomason/packer.nvim')

-- Rose-Pine. 
-- !NB! Change theme in bufferline if changing global theme
-- use({ 'rose-pine/neovim', as = 'rose-pine',
--   config = function()
--     require("rose-pine").setup({ disable_background = true })
--     vim.cmd('colorscheme rose-pine')

    -- Catpuccin
    -- !NB! Change theme in bufferline if changing global theme
use ({ "catppuccin/nvim", as = "catppuccin",
    config = function()
      require("catppuccin").setup({ transparent_background = true,}) -- disables setting the background color.
      vim.cmd.colorscheme "catppuccin"

      vim.api.nvim_set_hl(0, 'FloatBorder', {
          fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
          bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        })

      -- Make cursor-line background invisible
      vim.api.nvim_set_hl(0, 'FloatBorder', {
          fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
          bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        })

      vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

      vim.api.nvim_set_hl(0, 'StatusLineNonText', {
          fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
          bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
        })

      vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
    end,
  })

-- Carbon (Not working with other plugins.. Dont know why)
-- use { "michaeldyrynda/carbon", as = "carbon" }
-- vim.cmd.colorscheme "carbon"

-- Commenting support.(Type 'gcc' to comment/uncomment lines)
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text. Type 'cs' + sign you want to change " for example + sign you want it changed to
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite. (Not tried this yet)
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b. (Not tried this yet)
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support. (Auto indent code)
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands. (Allows typing '.' to repeat commands)
use('tpope/vim-repeat')

-- Add more languages.
use('sheerun/vim-polyglot')

-- Navigate seamlessly between Vim windows and Tmux panes.
-- use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text. (Mark text with 'v' and search for marked text with '*')
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes. (Type 'vix' to mark text inside XML document, 'dix' to delete, etc..)
use({
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user',
})

-- Automatically set the working directory to the project root.
use({
  'airblade/vim-rooter',
  setup = function()
    -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
})

-- Automatically add closing brackets, quotes, etc.
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- Add smooth scrolling to avoid jarring jumps (Smooth animation for scrolling with Ctrl + u and Ctrl + d)
use({
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup()
  end,
})

-- All closing buffers without closing the split window.
use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

-- Split arrays and methods onto multiple lines, or join them back up. (Type gS to split arrays, and gJ to join)
use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
  end,
})

-- Automatically fix indentation when pasting code.
use({
  'sickill/vim-pasta',
  config = function()
    vim.g.pasta_disabled_filetypes = { 'fugitive' }
  end,
})

-- Fuzzy finder
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('user/plugins/telescope')
  end,
})

-- File tree sidebar
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user/plugins/nvim-tree')
  end,
})

-- A status line
use ({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/plugins/lualine')
      end,
  })

-- Display buffers as tabs. (Change buffer using [b and ]b depending on right or left buffer)
use({
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  after = 'catppuccin',
  config = function()
    require('bufferline').setup() -- Change require to 'user/plugins/bufferline' for custom setup
  end,
})

use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('user/plugins/indent-blankline')
    end,
  })

-- Add a dashboard
use {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('user/plugins/dashboard-nvim')
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}

-- LazyGit using Telescope
use({
    "kdheepak/lazygit.nvim",
    requires = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
})

-- Terminal plugin
use({
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_heigth = 0.8
      vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
      vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
      -- Some styling, does not work well with invis background
      -- vim.cmd([[
      --   highlight link Floaterm CursorLine
      --   highlight link FloatermBorder CursorLineBg
      --   ]])
    end
  })

-- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('user/plugins/treesitter')
  end,
})

-- Language Server Protocol.
use({
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('user/plugins/lspconfig')
  end,
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
