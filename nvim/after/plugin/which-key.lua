local which_key = require('which-key')

--- Setup which key
which_key.setup({
  preset = 'helix',
  default = {},
  spec = {
    {
      mode = { 'n', 'v' },
      { '[', group = 'prev' },
      { ']', group = 'next' },
      { 'g', group = 'goto' },
      { 'z', group = 'fold' },
      {
        '<leader>b',
        group = 'buffer',
        expand = function()
          return require('which-key.extras').expand.buf()
        end,
      },
      { '<leader>c',  group = 'code' },
      { '<leader>f',  group = 'find' },
      { '<leader>fg', group = 'in git' },
      { '<leader>g',  group = 'git' },
      { '<leader>s',  group = 'swap' },
      { '<leader>t',  group = 'toggle' },
      { '<leader>y',  group = 'yank' },
      {
        '<leader>w',
        group = 'windows',
        proxy = '<c-w>',
        expand = function()
          return require('which-key.extras').expand.win()
        end,
      },
    },
  },
})

--- Which key related remaps
vim.keymap.set('n', '<leader>tw', function()
  which_key.show({ global = false })
end, { desc = 'Which key (buffer)' })

vim.keymap.set('n', '<leader>tW', function()
  which_key.show()
end, { desc = 'Which key (global)' })
