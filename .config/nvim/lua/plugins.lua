return {
  -- Core
  { 'folke/lazy.nvim', version = '*' },
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'lewis6991/impatient.nvim' },

  -- UI
  { 'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function(_, _) require('config.gruvbox') end,
  },
  { 'NLKNguyen/papercolor-theme' },
  -- TODO: Remove legacy branch
  { 'j-hui/fidget.nvim', tag = 'legacy', event = 'VeryLazy', config = true },
  { 'stevearc/dressing.nvim' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = function(_, _) require('config.lualine') end,
  },
  {
    'akinsho/bufferline.nvim',
    branch = 'main',
    dependencies = 'nvim-tree/nvim-web-devicons',
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


  -- Helpers
  { 'ntpeters/vim-better-whitespace', event = 'BufReadPre' },
  {
    'mg979/vim-visual-multi',
    event = 'BufReadPre',
    -- TODO: Move to config file
    config = function(_, _)
      vim.cmd [[
      let g:VM_maps["Exit"] = '<C-C>'
      ]]
    end,
  },
  { 'tpope/vim-fugitive' },
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl", event = 'VeryLazy', config = function(_, _) require("ibl").setup() end },
  { 'folke/trouble.nvim', event = 'VeryLazy' },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = function(_, _) require('config.autopairs') end },
  { 'numToStr/Comment.nvim', event = 'VeryLazy', config = true },
  { 'echasnovski/mini.surround', version = '*', config = function(_, _) require('config.mini-surround') end },
  { 'simnalamburt/vim-mundo', event = 'VeryLazy' }, -- pynvim requires
  { 'phaazon/hop.nvim', branch = 'v2', event = 'VeryLazy', config = true },
  { 'Shatur/neovim-session-manager', config = true },
  {
    'lewis6991/gitsigns.nvim',
    config = function(_, _) require 'config.gitsigns' end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    cond = vim.fn.executable 'cmake' == 1,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
    dependencies = {
      'plenary.nvim',
      'telescope-fzf-native.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
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
    dependencies = { 'plenary.nvim', 'mason.nvim', 'jay-babu/mason-null-ls.nvim'},
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, _) require('config.null-ls') end,
  },
  -- {
  --   'mfussenegger/nvim-dap',
  --   -- dependencies = { 'https://github.com/rcarriga/nvim-dap-ui' },
  --   config = function(_, _) require('config.nvim-dap') end,
  -- },
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
  },
  -- {
  --   "https://git.sr.ht/~p00f/clangd_extensions.nvim",
  -- },
  {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
}
