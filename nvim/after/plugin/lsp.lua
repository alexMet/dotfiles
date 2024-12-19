--- Setup autocompletion
require('lazydev').setup({
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
})

local blink = require('blink.cmp')
local capabilities = blink.get_lsp_capabilities()
blink.setup({
  keymap = { preset = 'default' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
    providers = {
      lsp = { fallback_for = { "lazydev" } },
      lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
    },
  },
  -- experimental signature help support
  signature = { enabled = true },
})

--- Setup mason for installing lsp servers
require('fidget').setup({})
require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = false,
  ensure_installed = {
    'clangd',
    'lua_ls',
    'ols',
    'pyright',
    'svelte',
    'tailwindcss',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
      })
    end,
    lua_ls = function()
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })
    end,
  },
})

--- Setup keymaps on lsp attach event
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    --- LSP remaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', '<leader>co', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, opts)

    --- Diagnostic remaps
    vim.keymap.set('n', '<leader>cl', vim.diagnostic.open_float, opts)
  end
})
