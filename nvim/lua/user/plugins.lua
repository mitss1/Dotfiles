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

-- Rose-pine
use({ 'rose-pine/neovim', as = 'rose-pine',
config = function()
  require('rose-pine').setup({
    disable_background = true,
    disable_float_background = true,  -- Sikrer at float windows også er transparente
  })
  vim.cmd('colorscheme rose-pine')

  -- Sikre transparent bakgrunn for ulike elementer
  vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { ctermbg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { ctermbg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { ctermbg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { ctermbg = 'none' })
end
})

-- Catpuccin
-- !NB! Change theme in bufferline if changing global theme
-- use ({
--     "catppuccin/nvim", as = "catppuccin",
--     config = function()
--       require("catppuccin").setup({ transparent_background = true,}) -- disables setting the background color.
--       vim.cmd('colorscheme catppuccin')

-- Carbon
-- use ({
--     "michaeldyrynda/carbon", as = "carbon",
--     config = function()
--       vim.api.nvim_create_augroup('MyColors', { clear = true })
--       vim.api.nvim_create_autocmd('ColorScheme', {
--           group = 'MyColors',
--           pattern = '*',
--           command = 'hi Normal ctermbg=none guibg=none',
--         })
--       vim.cmd('colorscheme carbon')

--       -- Set transparent background for signcolumn and line numbers
--       vim.cmd([[
--         highlight SignColumn guibg=none
--         highlight LineNr guibg=none
--         highlight CursorLineNr guibg=none
--         ]])

--       vim.api.nvim_set_hl(0, 'FloatBorder', {
--           fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
--           bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
--         })

--       -- Make cursor-line background invisible
--       vim.api.nvim_set_hl(0, 'FloatBorder', {
--           fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
--           bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
--         })

--       vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

--       vim.api.nvim_set_hl(0, 'StatusLineNonText', {
--           fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
--           bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
--         })

--       vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
--     end,
--   })

-- Commenting support.(Type 'gcc' to comment/uncomment lines)
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text. Type 'cs' + sign you want to change " for example + sign you want it changed to
-- ysiW" to surround a word with ". yss" to surround entire line with ". Use visual-mode and press S" to surround marked text with ".
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
  after = 'rose-pine',
  config = function()
    require('user/plugins/bufferline') -- Change require to 'user/plugins/bufferline' for custom setup
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
    'b0o/schemastore.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    require('user/plugins/lspconfig')
  end,
})

-- Completion
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('user/plugins/cmp')
  end,
})

-- PHP Refactoring Tools
use({
  'phpactor/phpactor',
  ft = 'php',
  run = 'composer install --no-dev --optimize-autoloader',
  config = function()
    vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>') -- Keymap only wokrs in php files
    vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>') -- Keymap only wokrs in php files
  end,
})

-- Project Configuration.
-- When in a php file, type :A to generate linked test tile
-- When in the new file, type <Leader>pn to generate Laravel test template
-- Trying :A again, will jump between the files
use({
  'tpope/vim-projectionist',
  requires = 'tpope/vim-dispatch',
  config = function()
    require('user/plugins/projectionist')
  end,
})

-- Testing helper
use({
  'vim-test/vim-test',
  config = function()
    require('user/plugins/vim-test')
  end,
})

-- Git integration.
use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    -- Disabled keymap for now
    -- vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    -- vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
    -- vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
    -- vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
    -- vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    -- vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
  end,
})

-- Git commands.
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
})

-- Harpoon
use ({
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require('harpoon')
      harpoon.setup()
      vim.keymap.set("n", "<Leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<leader>H", function() harpoon:list():add() end)
      vim.keymap.set("n", "<Leader>1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<Leader>2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<Leader>3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<Leader>4", function() harpoon:list():select(4) end)

      -- Telescope integration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
          end

          require("telescope.pickers").new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                  results = file_paths,
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
          }):find()
      end

      vim.keymap.set("n", "<Leader>fH", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })
    end,
})

-- Obsidian
use({
  "epwalsh/obsidian.nvim",
  tag = "*",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
      },
      daily_notes = {
        folder = "notes/dailies",
        default_tags = { "daily-notes" },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      new_notes_location = "current_dir",
      picker = {
        name = "telescope.nvim",
        note_mappings = {
          new = "<leader>os",
          insert_link = "<leader>ol",
        },
      },
      sort_by = "modified",
      sort_reversed = true,
      search_max_lines = 1000,
      open_notes_in = "current",

      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          -- Gjør tittelen om til et gyldig filnavn
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- Hvis ingen tittel, lag en tilfeldig 4-bokstavskode
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      note_path_func = function(spec)
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix(".md")
      end,
    })

  vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>", { desc = "Åpne notater" })
  vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Nytt notat" })
  vim.keymap.set("n", "<leader>od", ":ObsidianToday<CR>", { desc = "Dagens notat" })
  vim.keymap.set("n", "<leader>ox", function()
    require("obsidian.util").toggle_checkbox()
  end, { desc = "Toggle checkbox" })
  vim.keymap.set("n", "gf", ":ObsidianFollowLink<CR>", { desc = "Følg Obsidian-lenke" })
  vim.keymap.set("n", "<leader>og", function()
    require("telescope.builtin").live_grep({
        search_dirs = { "~/vaults/personal" }
      })
  end, { desc = "Søk i Obsidian-notater med Telescope" })
  vim.keymap.set("n", "<leader>oD", function()
    local file = vim.fn.expand("%:p") -- Hent filbanen til notatet
    local confirm = vim.fn.input("Slett denne filen? (y/n): ")

    if confirm == "y" then
      vim.fn.delete(file) -- Slett filen
      vim.cmd("bd") -- Lukk bufferen
      print("Fil slettet: " .. file)
    else
      print("Sletting avbrutt.")
    end
  end, { desc = "Slett Obsidian-notat" })
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
