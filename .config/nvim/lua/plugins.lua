return {
  -- Core
  { 'folke/lazy.nvim', version = '*' },
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'lewis6991/impatient.nvim' },

  -- UI
  { 'ellisonleao/gruvbox.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'j-hui/fidget.nvim', event = 'VeryLazy', config = true },
  { 'onsails/lspkind.nvim' }, -- Used only for nvim-cmp config
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = function(_, _) require('config.lualine') end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = 'v3.*',
    event = 'VeryLazy',
    config = function(_, _) require('config.bufferline') end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function(_, _) require('config.nvim-treesitter') end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    config = function(_, _) require('todo-comments').setup() end,
  },

  -- Practice
  { 'ThePrimeagen/vim-be-good' },
  { 'takac/vim-hardtime' },

  -- Helpers
  { 'ntpeters/vim-better-whitespace', event = 'BufReadPre' },
  { 'mg979/vim-visual-multi', event = 'VeryLazy' },
  { 'tpope/vim-fugitive' },
  { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },
  { 'folke/trouble.nvim', event = 'VeryLazy' },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = function(_, _) require('config.autopairs') end },
  { 'numToStr/Comment.nvim', event = 'VeryLazy', config = true },
  { 'echasnovski/mini.surround', version = '*', config = function(_, _) require('mini.surround').setup() end },
  { 'simnalamburt/vim-mundo', event = 'VeryLazy'}, -- pynvim requires
  { 'phaazon/hop.nvim', eveht = 'VeryLazy', branch = 'v2', config = true },
  {
    'lewis6991/gitsigns.nvim', event = 'VeryLazy',
    config = function(_, _) require 'config.gitsigns' end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    tag = 'nightly',
    event = 'VeryLazy',
    config = function(_, _) require('config.nvim-tree') end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- Only load if `cmake` is available
    cond = vim.fn.executable 'cmake' == 1,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    config = function(_, _) require('config.telescope') end,
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip'
    },
    event = 'InsertEnter',
    config = function(_, _) require('config.nvim-cmp') end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = 'cmp-nvim-lsp'
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function(_, _) require('config.null-ls') end,
  },
  {
    'williamboman/mason.nvim',
    dependencies = 'nvim-lspconfig',
    config = function(_, _) require('config.mason') end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'mason.nvim', 'nvim-lspconfig' },
    config = function(_, _) require('config.mason-lspconfig') end,
  },
}
