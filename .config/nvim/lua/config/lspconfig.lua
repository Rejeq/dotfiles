local masonLsp = require('mason-lspconfig')
local lsp = require('lspconfig')

local masonInstalled = {
  'clangd',
  'cmake',
  'lua_ls',
  'pylsp',
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
  settings = {
    clangd = {
      -- cmd = { 'clangd', '-j', '2', '--background-index', '--background-index-priority=background', '--pch-storage=disk' },
    }
  }
}

local pylspConfig = {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'E501' },
          maxLineLength = 100,
        }
      }
    }
  }
}

masonLsp.setup({
  ensure_installed = masonInstalled
})

masonLsp.setup_handlers({
  -- function(server) lsp[server].setup({}) end,

  -- ['clangd'] = function() lsp.clangd.setup(clangdConfig) end,
  ['cmake'] = function() lsp.cmake.setup({}) end,
  ['lua_ls'] = function() lsp.lua_ls.setup(luaConfig) end,
  -- ['rust_analyzer'] = function() lsp.rust_analyzer.setup({}) end,
  ['pylsp'] = function() lsp.pylsp.setup(pylspConfig) end,
})

lsp.clangd.setup(clangdConfig)
lsp.gopls.setup({})

lsp.texlab.setup({
  settings = {
    texlab = {
      -- rootDirectory = "report/",
      -- auxDirectory = "build",
      build = {
        executable = 'tectonic',
        args = { '-X', 'compile', '%f', '--synctex', '--keep-logs', '--keep-intermediates' },
      },
    },
  },
})
