return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    local statusline = require 'mini.statusline'
    require('mini.ai').setup { n_lines = 500 }
    require('mini.move').setup()
    require('mini.surround').setup()

    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
