-- [[ Setting options ]]
-- See `:help vim.opt`opt
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- vim: ts=2 sts=2 sw=2 et
--
--
vim.wo.relativenumber = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.linebreak = true
vim.opt.mouse = 'a'
vim.opt.cmdheight = 0
vim.opt.shell = '/usr/bin/fish'
vim.opt.termguicolors = true
vim.opt.whichwrap:append '<>[]hl'

-- for better spacing, instead of tab

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.title = true
vim.opt.titlestring = 'nvim: %{expand("%:t")}'

-- get rid of ~ on newlines in neovim
vim.opt.fillchars:append { eob = ' ' }
