local bufferline = require('bufferline')

local options = {
  offsets = { {
    filetype = "NvimTree",
    text = "File Explorer",
    text_align = "center",
    separator = true
  } },
}

bufferline.setup { options = options }
