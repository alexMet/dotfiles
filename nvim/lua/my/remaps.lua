vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--- General
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Esc>:w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<C-q>', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move selected line up' })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move selected line down' })
vim.keymap.set('n', '<leader>tf', ':25Lexplore<CR>', { desc = 'File tree' })
vim.keymap.set('n', '<leader>n', ':enew<CR>', { desc = 'Create a new file' })
vim.keymap.set('n', '<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Swap word under cursor for another' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>yf', ':let @+ = expand("%")<CR>', { desc = 'Copy file name to clipboard' })
vim.keymap.set('n', '<leader>yp', ':let @+ = expand("%:p")<CR>', { desc = 'Copy file path to clipboard' })

--- Kepp the focus in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

--- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>bc', ':%bdelete|e#|bdelete#<CR>', { desc = 'Close all buffers except current' })
vim.keymap.set('n', '<leader>bC', ':%bdelete<CR>', { desc = 'Close all buffers' })
vim.keymap.set('n', '<leader>bd', function()
    vim.api.nvim_buf_delete(0, {})
end, { desc = 'Close current buffer' })

--- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Quit terminal' })
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', { desc = 'Move left' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', { desc = 'Move down' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', { desc = 'Move up' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', { desc = 'Move right' })

--- Windows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window size top' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window size bottom' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window size left' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window size right' })
