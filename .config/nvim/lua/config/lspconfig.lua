local masonLsp = require('mason-lspconfig')
local lsp = require('lspconfig')

local masonInstalled = {
  'clangd',
  'cmake',
  'lua_ls',
  'bashls',
}

local luaConfig = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

local clangdConfig = {
  cmd = { 'clangd', '-j', '2', '--background-index', '--background-index-priority=low' },
}

masonLsp.setup({
  ensure_installed = masonInstalled
})

masonLsp.setup_handlers({
  -- function(server) lsp[server].setup({}) end,

  -- ['clangd'] = function() lsp.clangd.setup(clangdConfig) end,
  ['cmake'] = function() lsp.cmake.setup({}) end,
  ['pylsp'] = function() lsp.pylsp.setup({}) end,
  ['bashls'] = function() lsp.bashls.setup({}) end,
  ['lua_ls'] = function() lsp.lua_ls.setup(luaConfig) end,
  ['rust_analyzer'] = function() lsp.rust_analyzer.setup({}) end,
})

-- lsp.ccls.setup {
--   init_options = {
--     compilationDatabaseDirectory = "build";
--     index = {
--       threads = 1;
--     };
--      cache = {
--        directory = ".cache";
--      };
--   }
-- }
