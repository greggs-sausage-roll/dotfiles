return {

  -- Formerly, used to use bufferline, but i now switch buffers via telescope builtin.buffers, if you want you can re-enable bufferline by uncommenting the following line
  -- require 'custom.plugins.configs.bufferline',

  -- Formerly used to use Alpha as Dashboard, now use mini.starter
  -- require 'custom.plugins.configs.alpha',

  -- require 'custom.plugins.configs.twilight',

  -- Colorscheme: rose-pine-moon
  -- require 'custom.plugins.configs.catppuccin',
  -- require 'custom.plugins.configs.rose-pine',

  -- statusline
  -- require 'custom.plugins.configs.lualine',

  -- for better formatting
  require 'custom.plugins.configs.indent-blankline',

  require 'custom.plugins.configs.fzf',

  -- require 'custom.plugins.configs.blink',
  -- require 'custom.plugins.configs.markdown-preview',
  --
  require 'custom.plugins.configs.markview',

  -- Colorsises colors and hex codes like '#7287fd'
  -- require 'custom.plugins.configs.nvim-colorizer',
}
