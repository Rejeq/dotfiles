local function map(mode, lhs, rhs, desc, extra_opts)
  local options = { desc = desc, noremap = true, silent = true }
  if extra_opts then
    options = vim.tbl_extend('force', options, extra_opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

-- Window navigation with ctrl only
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<C-l>', ':nohl <CR>', 'Reset search highlighting')

vim.cmd [[ command! W :w ]]
map('i', '<C-s>', '<Esc>:w<cr>i', 'Quick save')

map('n', '<leader>rr', ':%s///g<Left><Left>', 'Quick replace')
map('v', '<leader>rr', ':s///g<Left><Left>', 'Quick replace')

map('n', '<leader>tn', '<cmd> set relativenumber! <CR>', 'Toggle relative number')

map('n', '<leader>rc', ':update $MYVIMRC <cr> :source $MYVIMRC <cr>', 'Reload config')

-- new buffer
map('n', '<leader>b', '<cmd> enew <CR>', 'New buffer')
map('n', '<leader>c', '<cmd> bp <BAR> bd #<CR>', 'Close the current buffer tab')

-- Telescope
map('n', '<leader>ff', '<cmd> Telescope find_files <cr>', 'Find files')
map('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>', 'Find all')
map('n', '<leader>fg', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>', 'Find file with grep')
map('n', '<leader>fag',
  ':lua require("telescope").extensions.live_grep_args.live_grep_args({ default_text = "--no-ignore "})<cr>'
  , 'Find all file with grep, ignoring .gitignore')

map('n', '<leader>fb', '<cmd> Telescope buffers <cr>', 'Find buffers')
map('n', '<leader>fp', '<cmd> Telescope help_tags <cr>', 'Find in help page')
map('n', '<leader>fh', '<cmd> Telescope oldfiles <cr>', 'Find history')

map('n', '<leader>gf', '<cmd> Telescope git_files <cr>', 'Git files')
map('n', '<leader>gs', '<cmd> Telescope git_status <cr>', 'Git status')
map('n', '<leader>gc', '<cmd> Telescope git_commits <cr>', 'Git commits')
map('n', '<leader>gb', '<cmd> Telescope git_bcommits <cr>', 'Git buffer commits')

map('n', '<leader>fk', '<cmd> Telescope keymaps <cr>', 'Find key maps')

map('n', '<leader>cc', '<cmd> Telescope colorscheme <cr>', 'Change colorsheme')
map('n', '<leader>ct', '<cmd> let &bg=(&bg=="light"?"dark":"light") <cr>', 'Toggle colorsheme between dark and light')


-- bufferline.nvim
map('n', '<C-[>', ':BufferLineCyclePrev<CR>', 'Go to previous buffer')
map('n', '<C-]>', ':BufferLineCycleNext<CR>', 'Go to next buffer')

map('n', '<M-1>', '<cmd> BufferLineGoToBuffer 1<cr>')
map('n', '<M-2>', '<cmd> BufferLineGoToBuffer 2<cr>')
map('n', '<M-3>', '<cmd> BufferLineGoToBuffer 3<cr>')
map('n', '<M-4>', '<cmd> BufferLineGoToBuffer 4<cr>')
map('n', '<M-5>', '<cmd> BufferLineGoToBuffer 5<cr>')
map('n', '<M-6>', '<cmd> BufferLineGoToBuffer 6<cr>')
map('n', '<M-7>', '<cmd> BufferLineGoToBuffer 7<cr>')
map('n', '<M-8>', '<cmd> BufferLineGoToBuffer 8<cr>')
map('n', '<M-9>', '<cmd> BufferLineGoToBuffer 9<cr>')
map('n', '<M-$>', '<cmd> BufferLineGoToBuffer -1<cr>')


-- Comment.nvim
map('n', '[c', '<plug>(comment_toggle_linewise_current)', 'Toggle linewise comment')
map('v', '[c', '<plug>(comment_toggle_linewise_visual)', 'Toggle linewise comment')

map('n', '[x', '<plug>(comment_toggle_blockwise_current)', 'Toggle blocwise comment')
map('v', '[x', '<plug>(comment_toggle_blockwise_visual)', 'Toggle blockwise comment')


-- vim-mundo
map('n', '<leader>u', '<cmd> MundoToggle<cr>', 'Toggle undo tree')


-- Hop.nvim
map('n', '<leader>/', '<cmd> lua require("hop").hint_words()<cr>', 'Jump to word after cursor')

-- LspConfig
map('n', 'gsh', '<cmd> ClangdSwitchSourceHeader<cr>', 'Clangd swith header')

map('n', '<C-[>', ':BufferLineCyclePrev<CR>', 'Go to previous buffer')
map('n', 'gD', '<cmd> lua vim.lsp.buf.declaration()<cr>', 'Lsp declaration')
map('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<cr>', 'Lsp definition')
map('n', 'gi', '<cmd> lua vim.lsp.buf.implementatio()<cr>', 'Lsp implementation')
map('n', 'gr', '<cmd> lua vim.lsp.buf.references()<cr>', 'Lsp references')
map('n', 'K', '<cmd> lua vim.lsp.buf.hover()<cr>', 'Lsp hover')

map('n', '<leader>D', '<cmd> lua vim.lsp.buf.type_definition()<cr>', 'Lsp definition type')
map('n', '<C-k>', '<cmd> lua vim.lsp.buf.signature_help()<cr>', 'Lsp signature help')
map('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<cr>', 'Lsp rename')
map('n', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<cr>', 'Lsp code_action')

map('n', '<leader>d', '<cmd> lua vim.diagnostic.open_float()<cr>', 'Floating diagnosting')
map('n', '[d', '<cmd> lua vim.diagnostic.goto_prev()<cr>', 'Goto prev')

map('n', '<leader>q', '<cmd> lua vim.diagnostic.setloclist()<cr>', 'Diagnostic setloclist')
map('n', '<leader>fm', '<cmd> lua vim.lsp.buf.format({ async = true })<cr>', 'Lsp formatting')
map('n', '<leader>wa', '<cmd> lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add workspace folder')
map('n', '<leader>q', '<cmd> lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Remove workspace folder')
map('n', '<leader>wl', '<cmd> lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', 'List workspace folders')

-- neovim-session-manager
map('n', '<leader>cs', '<cmd> SessionManager load_session<CR>', 'Change session')

-- yazi
map('n', '<leader>ef', function() require('yazi').yazi() end, "Enter to Folder")
map('n', '<leader>ewf', function() require('yazi').yazi(nil, vim.fn.getcwd()) end, "Enter to Working Folder")
