local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.ftplugin_sql_omni_key = '<C-j>'

g.VM_leader = "."
g.VM_mouse_mappings = true

g.spellfile_URL = 'https://ftp.nluug.nl/pub/vim/runtime/spell/'

-- global statusline
opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true -- Remember the undo history of an already closed file

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 500

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- opt.whichwrap:append "<>[]hl"

-- Auto update buffers, when changed from outside
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "if &buftype != 'nofile'" },
})
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  command = "lua vim.notify('File changed on disk. Buffer reloaded.')",
  pattern = { "*" },
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.typ",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "typst")
  end,
})
