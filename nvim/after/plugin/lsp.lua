--- Setup LSPs
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

local cp = require('cmp_nvim_lsp').default_capabilities()
local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cp)

require('fidget').setup({})
require('neodev').setup()
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'lua_ls',
    'pyright',
    'ols',
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

--- Setup autocompletion
require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    fields = { 'abbr', 'menu', 'kind' },
    format = function(entry, item)
      local short_name = { nvim_lsp = 'LSP', nvim_lua = 'nvim' }
      local menu_name = short_name[entry.source.name] or entry.source.name
      item.menu = string.format('[%s]', menu_name)
      return item
    end,
  },
})
