local bufferline = require('bufferline')

local options = {
  offsets = { {
    filetype = "NvimTree",
    text = "File Explorer",
    text_align = "center",
    separator = true
  } },

  indicator = {
    icon = '▎', -- this should be omitted if indicator style is not 'icon'
    style = 'icon' ,
  },
  buffer_close_icon = '',
  modified_icon = '●',
  close_icon = '',
  left_trunc_marker = '',
  right_trunc_marker = '',
}

bufferline.setup { options = options }
