local autopairs = require('nvim-autopairs')

local options = {
  map_cr = true,
  disable_filetype = { 'TelescopePrompt', 'vim' },
}

autopairs.setup(options)
