--- Spaces & Tabs
vim.opt.tabstop = 4         -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4     -- Number of spaces in tab when editing
vim.opt.expandtab = true    -- Tabs are spaces
vim.opt.smartindent = true  -- Automatically indent the next line

--- UI Config
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Show relative line numbers
vim.opt.showmatch = true        -- Highlight matching [{()}]
vim.opt.splitright = true       -- Split vertically to the right
vim.opt.scrolloff = 5           -- Keep some lines around the cursor
vim.opt.wrap = false            -- Don't wrap lines around

--- Searching
vim.opt.ignorecase = true   -- Ignore case when searching
vim.opt.smartcase = true    -- Use case if any caps used
vim.opt.incsearch = true    -- Search as characters are entered
vim.opt.hlsearch = false    -- Don't highlight matches

--- Backup
vim.opt.swapfile = false    -- Don't create .swp files

--- Colors
vim.opt.termguicolors = true    -- Enable true color support
vim.opt.colorcolumn = "80"      -- Highlight the 80th column

--- File tree browser
vim.g.netrw_banner = 0      -- Hide the banner
vim.g.netrw_liststyle = 3   -- Use the tree style listing
vim.g.netrw_winsize = 25    -- Take 25% of window size
