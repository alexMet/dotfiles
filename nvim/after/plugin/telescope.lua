local builtin = require('telescope.builtin')
require('telescope').load_extension('fzf')

--- Git related search remaps
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, { desc = 'Branches' })
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, { desc = 'Commits' })
vim.keymap.set('n', '<leader>fgC', builtin.git_bcommits, { desc = 'Buffer commits' })
vim.keymap.set('n', '<leader>fgs', builtin.git_status, { desc = 'Status' })
vim.keymap.set('n', '<leader>fgS', builtin.git_stash, { desc = 'Stash items' })

--- Other search remaps
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Word under cursor' })
vim.keymap.set('n', '<leader>fC', builtin.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Word' })

vim.keymap.set('n', '<leader>ft', function()
  builtin.colorscheme({ enable_preview = true })
end, { desc = 'Colorschemes' })

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ hidden = true, no_ignore = true })
end, { desc = 'All files' })
