local o = vim.o

o.guifont = "Iosevka Nerd Font Mono:h14"

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

local options = { desc="neovide shit", noremap = true, silent = true }
vim.keymap.set('n', '+', function() change_scale_factor(1.1) end, { desc='Increase scale' })
vim.keymap.set('n', '_', function() change_scale_factor(1/1.1) end, { desc='Decrease scale' })
vim.keymap.set('n', '<F11>', ':let g:neovide_fullscreen = !g:neovide_fullscreen<cr>', { desc='Fullscreen' })
