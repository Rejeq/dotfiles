local lualine = require('lualine')

local options = {
  icons_enabled = true,
  theme = 'auto',
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
  disabled_filetypes = {
    statusline = {},
    winbar = {},
  },
  ignore_focus = {},
  always_divide_middle = true,
  globalstatus = true,
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  }
}

local sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch', 'diff', 'diagnostics' },
  lualine_c = { 'filename' },
  lualine_x = { 'encoding', 'fileformat' },
  lualine_y = { 'progress' },
  lualine_z = { 'location' }
}

local inactive = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { "filename" },
  lualine_x = {},
  lualine_y = {},
  lualine_z = { "location" },
}

lualine.setup {
  options = options,
  sections = sections,
  inactive_sections = inactive,
}
