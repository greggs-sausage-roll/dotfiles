-- [[ Basic Keymaps ]] See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--
-- better j and k movement
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>sp', '<cmd>set spell!<CR>', { desc = 'toggle spell check' })

vim.keymap.set('n', '<leader>ms', '<cmd>lua MiniStarter.open()<CR>', { desc = 'Mini.starter dashboard' })

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'open Lazy dashboard' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'move focus to left split' })

vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'move focus to lower split' })

vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'move focus to upper split' })

vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'move window focus to right split' })

vim.keymap.set('n', '<A-c>', '<C-w>x', { desc = 'swap with next split' })

vim.keymap.set('n', '<A-w>', '<cmd>vertical resize +5<CR>', { desc = 'Increase size of split vertically by 5' })

vim.keymap.set('n', '<A-n>', '<cmd>vertical resize -5<CR>', { desc = 'Decrease size of split vertically by 5' })

vim.keymap.set('n', '<A-t>', '<cmd>resize +5<CR>', { desc = 'Increase size of slpit horizontally by 5' })

vim.keymap.set('n', '<A-s>', '<cmd>resize -5<CR>', { desc = 'Decreasecrease size of slpit horizontally by 5' })

vim.keymap.set('n', '<A-v>', '<cmd>vsplit<CR>', { desc = 'open a vertical split' })

vim.keymap.set('n', '<A-o>', '<cmd>split<CR>', { desc = 'open a normal horizonatal slpit' })

vim.keymap.set('n', '<A-x>', '<cmd>close<CR>', { desc = 'Close split' })

vim.keymap.set('n', '<leader>mr', '<cmd>MarkdownPreview<CR>', { desc = 'Open markdown preview in browser' })

-- vim.keymap.set('n', '<leader>z', '<cmd>Twilight<CR>', { desc = 'Toggle twilight' })

vim.keymap.set('n', '<leader>n', '<cmd>set nonumber! norelativenumber! nonumber!<CR>', { desc = 'Toggle relative number' })

-- vim.keymap.set('n', '<leader>x', '<cmd>bdelete!<CR>', { desc = 'closes the current buffer' })

vim.cmd 'cabbrev help vert help'

--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- A function that zooms in to current buffer, and opens twilight. Useful for writing documents, where stuff like lualine and barbar can be distracting.
vim.keymap.set('n', '<A-z>', function()
  -- Get initial height then see if height afer .zoom is bigger, to determine if we zooming in or out.
  local initial_height = vim.api.nvim_win_get_height(0)
  MiniMisc.zoom()
  local changed_height = vim.api.nvim_win_get_height(0)
  -- Checks if twilight is enabled
  -- local is_enabled = require('twilight.view').enabled
  -- if is_enabled and changed_height <= initial_height then
  --   vim.cmd 'TwilightDisable'
  -- else
  --   if changed_height > initial_height then
  --     vim.cmd 'TwilightEnable'
  --   end
  -- end

  -- If in kitty, IE terminal neovim, then increase size using kitty, if in neovide, increase size using neovide scale factor
  if not vim.g.neovide then
    if changed_height > initial_height then
      os.execute 'kitten @ set-font-size -- +2'
    else
      os.execute 'kitten @ set-font-size -- -2'
    end
  else
    if changed_height > initial_height then
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * (1.10 ^ 2)
    else
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * ((1 / 1.10) ^ 2)
    end
  end
end, { desc = 'Toggles fullscreen + Twilight mode' })

vim.keymap.set('n', ';', ':', { desc = 'Go to command mode' })

vim.keymap.set('v', '<', '<gv', { desc = 'Better indentation' })
vim.keymap.set('v', '>', '>gv', { desc = 'better indentation' })

-- set of functions that increase cmdline height when recording a macro.
vim.api.nvim_create_autocmd('RecordingEnter', {
  pattern = '*',
  callback = function()
    vim.opt_local.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
  pattern = '*',
  callback = function()
    local timer = vim.loop.new_timer()
    -- NOTE: Timer is here because we need to close cmdheight AFTER
    -- the macro is ended, not during the Leave event
    timer:start(
      50,
      0,
      vim.schedule_wrap(function()
        vim.opt_local.cmdheight = 0
      end)
    )
  end,
})

vim.keymap.set('n', '<leader>j', "<CMD>:%!jq '.'<CR>", { desc = 'Formates json file with jq' })

-- Buffer switching in neovim via telescope cause i donnt want have a bufferline
-- vim.keymap.set(
--   'n',
--   '<Tab>',
--   '<CMD>lua require("telescope.builtin").buffers({ sort_mru = true , ignore_current_buffer = true})<CR>',
--   { desc = '[ ] Find existing buffers' }
-- )

-- autocmd that runs when the neovim terminal buffer opens
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'sets variable for when terminal opens',
  callback = function()
    vim.cmd "let g:terminal_color_2 = '#7dc4e4'"
    vim.cmd "let g:terminal_color_10 = '#7dc4e4'"
    vim.cmd "let g:terminal_color_3 = '#CBA6F7'"
    vim.cmd "let g:terminal_color_11 = '#CBA6F7'"
    vim.cmd "let g:terminal_color_4 = '#789beb'"
    vim.cmd "let g:terminal_color_12 = '#789beb'"
    vim.cmd "let g:terminal_color_5 = '#F5C2E7'"
    vim.cmd "let g:terminal_color_13 = '#F5C2E7'"
    vim.cmd "let g:terminal_color_6 = '#b4befe'"
    vim.cmd "let g:terminal_color_14 = '#b4befe'"
    vim.cmd 'set nospell'
    vim.cmd 'set nonumber! norelativenumber! nonumber!'
  end,
})

vim.keymap.set('n', '<leader>fo', '<cmd>FzfLua oldfiles<CR>', { desc = '[f]ind [o]ldfiles' })
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = '[f]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua helptags<CR>', { desc = '[f]ind [H]elp' })
vim.keymap.set('n', '<leader>fk', '<cmd>FzfLua keymaps<CR>', { desc = '[f]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep_native<CR>', { desc = '[f]ind by [G]rep' })
-- vim.keymap.set('n', '<leader>fd', '<cmd>FzfLua<CR>', { desc = '[f]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua commands<CR>', { desc = '[f]ind [c]ommands' })
vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua registers<CR>', { desc = '[f]ind [r]egisters' })
vim.keymap.set('n', '<leader>gc', '<cmd>FzfLua git_commits<CR>', { desc = 'find [g]it [c]ommits' })
vim.keymap.set('n', '<leader>fi', '<cmd>FzfLua command_history<CR>', { desc = '[f]ind command h[i]story' })
vim.keymap.set('n', '<leader>fe', '<cmd>FzfLua resume<CR>', { desc = '[f]ind r[e]sume' })
vim.keymap.set('n', '<leader>fl', '<cmd>FzfLua lgrep_curbuf<CR>', { desc = '[f]ind in buffer [l]ines' })

vim.keymap.set('n', '<leader>fn', '<cmd>FzfLua files cwd=~/.config/nvim/<CR>', { desc = '[f]ind [n]eovim files' })
vim.keymap.set('n', 'z=', '<cmd>FzfLua spell_suggest<CR>', { desc = 'spellsuggestions' })
vim.keymap.set('n', '<Tab>', '<cmd>FzfLua buffers<CR>', { desc = 'find buffers' })

-- vim: ts=2 sts=2 sw=2 et
