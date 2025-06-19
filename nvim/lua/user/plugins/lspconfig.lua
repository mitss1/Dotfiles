-- Setup Mason to automatically install LSP servers
-- Can run :Mason to bring up UI
require('mason').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP keymaps function
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

-- Manual LSP setup without mason-lspconfig handlers
require('lspconfig').intelephense.setup({
    commands = {
        IntelephenseIndex = {
            function()
                vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
            end,
        },
    },
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        licenceKey = vim.env.INTELEPHENSE_LICENSE_KEY
    },
    filetypes = { 'php' }
})

require('lspconfig').tailwindcss.setup({ 
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'css', 'html', 'vue', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }
})

require('lspconfig').jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
        },
    },
    filetypes = { 'json', 'jsonc' }
})


-- null-ls
require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
  },
})

require('mason-null-ls').setup()

-- Commands
vim.api.nvim_create_user_command('Format', vim.lsp.buf.format or vim.lsp.buf.formatting, {})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
