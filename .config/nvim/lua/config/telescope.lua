local telescope = require('telescope')
local actions = require('telescope.actions')

local mappings = {
  i = {
    ['<C-Up>'] = actions.cycle_history_prev,
    ['<C-Down>'] = actions.cycle_history_next,
    ["<C-[>"] = actions.results_scrolling_left,
    ["<C-]>"] = actions.results_scrolling_right,
  },
}

local fzfConfig = {
  fuzzy = true, -- false will only do exact matching
  override_generic_sorter = true, -- override the generic sorter
  override_file_sorter = true, -- override the file sorter
  case_mode = "smart_case", -- or "ignore_case" or "respect_case"
  -- the default case_mode is "smart_case"
}

telescope.setup {
  defaults = {
    mappings = mappings,
  },
  extensions = {
    fzf = fzfConfig,
  },
}

telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')
