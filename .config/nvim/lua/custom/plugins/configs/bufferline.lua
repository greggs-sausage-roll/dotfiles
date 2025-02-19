return {
  'akinsho/bufferline.nvim',
  event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
  keys = {
    { '<S-tab>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<Tab>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>x', '<cmd>bdelete<CR>', desc = 'close buffer' },
    { '<A-.>', '<cmd>BufferLineMoveNext<CR>', desc = 'move buffer to the right' },
    { '<A-,>', '<cmd>BufferLineMovePrev<CR>', desc = 'move buffer to the left' },
  },
  config = function()
    require('bufferline').setup {
      highlights = require 'rose-pine.plugins.bufferline',
    }
  end,
}
