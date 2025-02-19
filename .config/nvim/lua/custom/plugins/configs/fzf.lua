return {
  -- optional for icon support
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    winopts = {
      split = 'belowright new',
      -- width = 0.55,
      -- height = 0.60,
      -- row = 0.45,
      -- col = 0.50,
      border = 'single',
      backdrop = 100,
      treesitter = {
        enabled = true,
      },
      preview = {
        default = 'bat',
        hidden = 'hidden',
        scrollbar = 'block',
      },
    },
    keymap = {
      builtin = {
        ['<C-j>'] = 'preview-page-down',
        ['<C-k>'] = 'preview-page-up',
        ['<C-S-j>'] = 'preview-down',
        ['<C-S-k>'] = 'preview-up',
        ['<M-space>'] = 'toggle-preview',
      },
    },
    fzf_opts = {
      ['--layout'] = 'default',
    },
    files = {
      cmd = 'fd --color=never --type f --hidden --follow --exclude .git',
    },
  },
}
