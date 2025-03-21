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
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  signature = { enabled = true },
  -- cmdline = { enabled = false },
  completion = {
    trigger = {
      prefetch_on_insert = false,
    },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
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
    local get_opts = function(desc)
      return { buffer = event.buf, desc = desc }
    end

    --- LSP remaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, get_opts('Goto definition'))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, get_opts('Goto declaration'))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, get_opts('Goto references'))
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, get_opts('Goto implementation'))
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, get_opts('Actions'))
    vim.keymap.set('n', '<leader>cf', function()
      vim.lsp.buf.format({ async = true })
    end, get_opts('Format'))
    vim.keymap.set('n', '<leader>ct', vim.lsp.buf.type_definition, get_opts('Type definition'))
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, get_opts('Rename'))
    vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, get_opts('Signature help'))

    --- Diagnostic remaps
    vim.keymap.set('n', '<leader>co', vim.diagnostic.open_float, get_opts('Open diagnostics'))
  end
})
