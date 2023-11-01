local opt = vim.opt
local g = vim.g

-- TODO: Do not forget delete this
vim.g["hardtime_default_on"] = 1

g.mapleader = " "

g.VM_leader = "."
g.VM_mouse_mappings = true

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
opt.mouse = nil

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
opt.undofile = true   -- Remember the undo history of an already closed file

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 500

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- opt.whichwrap:append "<>[]hl"

g.spellfile_URL = 'https://ftp.nluug.nl/pub/vim/runtime/spell/'
