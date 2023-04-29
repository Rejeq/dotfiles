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
  { 'stevearc/dressing.nvim' },
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
    dependencies = 'nvim-tree/nvim-web-devicons',
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
  { 'simnalamburt/vim-mundo', event = 'VeryLazy' }, -- pynvim requires
  { 'phaazon/hop.nvim', branch = 'v2', event = 'VeryLazy', config = true },
  { 'Shatur/neovim-session-manager', event = 'BufWritePost', cmd = 'SessionManager', config = true },

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
    cond = vim.fn.executable 'cmake' == 1,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'telescope-fzf-native.nvim', 'plenary.nvim' },
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
    'williamboman/mason.nvim',
    config = function(_, _) require('config.mason') end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'mason.nvim', 'williamboman/mason-lspconfig.nvim', 'cmp-nvim-lsp' },
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, _) require('config.lspconfig') end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'plenary.nvim', 'mason.nvim' },
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, _) require('config.null-ls') end,
  },
}
