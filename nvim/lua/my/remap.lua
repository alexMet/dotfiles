vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>o', ':25Lexplore<CR>') -- Open the project explorer
vim.keymap.set({'n', 'v'}, '<leader>y', [['+y]])    -- Copy to system clipboard
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')         -- Escape from the terminal

--- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>')          -- Go to next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')    -- Go to previous buffer
vim.keymap.set('n', '<leader>d>', ':bdelete<CR>')   -- Close current buffer

--- Tabs
vim.keymap.set('n', '<leader>c', vim.cmd.tabclose)  -- Close the current tab
vim.keymap.set('n', '<leader>C', vim.cmd.tabonly)   -- Close all but the current tab

--- Windows
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

--- Autopairs
vim.keymap.set('i', '\'', '\'\'<Left>')
vim.keymap.set('i', '"', '""<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')

--- Save and quit a little faster
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<C-q>', ':q<CR>')

--- Move selected lines around
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

--- Kepp the focus in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

--- Search and replace word under the cursor
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
