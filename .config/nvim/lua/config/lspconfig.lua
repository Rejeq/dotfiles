local masonLsp = require('mason-lspconfig')
local lsp = require('lspconfig')

masonLsp.setup({
  ensure_installed = nil,
  automatic_installation = false,
  handlers = {},
})

lsp.cmake.setup {}
lsp.gopls.setup {}
lsp.clangd.setup {}

lsp.lua_ls.setup {
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

lsp.pylsp.setup {
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

-- lsp.ltex.setup {
--   cmd = { "ltex-ls" },
--   filetypes = { "markdown" },
--   flags = { debounce_text_changes = 300 },
-- }

lsp.tinymist.setup {
  single_file_support = true,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  settings = {
    exportPdf = "onSave",
    outputPath = "$root/target/$name",
    systemFonts = true,
    fontPaths = { "usr/share/fonts/TTF" },
  }
}

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

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "typst" },
  callback = function(_)
    local root_files = { 'main.typ' }
    local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
    local root_dir = vim.fs.dirname(paths[1])

    vim.lsp.start({
      name = "typst_lsp",
      cmd = { 'typst-languagetool-lsp' },
      root_dir = root_dir,
      init_options = {
        host = "http://127.0.0.1",
        port = "8889",
        root = root_dir,
        main = root_dir .. "/main.typ",
      },
    })
  end,
})
