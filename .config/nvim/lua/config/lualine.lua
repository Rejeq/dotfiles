local lualine = require('lualine')

local options = {
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
  always_divide_middle = true,
  globalstatus = true,
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
