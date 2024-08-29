local mason_null_ls = require('mason-null-ls')
local null_ls = require('null-ls')

local ensure_installed = {
  'clang_format',
  'shfmt',
  'yamlfmt',
}

mason_null_ls.setup({
  ensure_installed = ensure_installed,
  automatic_installation = true,
  handlers = {

  },
})

null_ls.setup({
  sources = {
    -- null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.sql_formatter,
    -- null_ls.builtins.formatting.rustfmt,
    -- null_ls.builtins.formatting.ktlint,
  },
})
