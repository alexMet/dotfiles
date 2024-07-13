local builtin = require('telescope.builtin')
require('telescope').load_extension('fzf')

--- Git related search remaps
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fgC', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>fgs', builtin.git_status, {})
vim.keymap.set('n', '<leader>fgS', builtin.git_stash, {})

--- Other search remaps
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fC', builtin.commands, {})
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true, no_ignore = true }) end, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>ft', function() builtin.colorscheme({ enable_preview = true }) end, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
