local masonLsp = require('mason-lspconfig')
local lsp = require('lspconfig')

local masonInstalled = {
  'clangd',
  'cmake',
  'lua_ls',
  'bashls',
}

local luaSetup = {
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

local clangdSetup = {
  cmd = { 'clangd', '-j', '2', '--background-index', '--background-index-priority=low' },
}

local bashlsSetup = {
  -- root_dir = function(fname)
  --   return vim.loop.cwd()
  -- end,
}

masonLsp.setup({
  ensure_installed = masonInstalled
})

masonLsp.setup_handlers({
  -- function(server) lsp[server].setup({}) end,

  -- ['clangd'] = function() lsp.clangd.setup(clangdSetup) end,
  ['cmake'] = function() lsp.cmake.setup({}) end,
  ['pylsp'] = function() lsp.pylsp.setup({}) end,
  ['bashls'] = function() lsp.bashls.setup(bashlsSetup) end,
  ['lua_ls'] = function() lsp.lua_ls.setup(luaSetup) end,
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
