local luasnip = require('luasnip')
local lspkind = require('lspkind')
local cmp = require('cmp')

local function HasWordsBefore()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function Enabled()
  -- disable completion in comments
  local context = require 'cmp.config.context'
  -- keep command mode completion enabled when cursor is in a comment
  if vim.api.nvim_get_mode().mode == 'c' then
    return true
  else
    return not context.in_treesitter_capture("comment")
        and not context.in_syntax_group("Comment")
  end
end

local function Format(entry, vim_item)
  return lspkind.cmp_format({
    with_text = true,
    menu = {
      nvim_lsp = "[LSP]",
      buffer   = "[Buf]",
      nvim_lua = "[Api]",
      path     = "[Path]",
      luasnip  = "[Snip]",
    }
  })(entry, vim_item)
end

-- Default formatting
-- local function Format(entry, vim_item)
--   if vim.tbl_contains({ 'path' }, entry.source.name) then
--     local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
--     if icon then
--       vim_item.kind = icon
--       vim_item.kind_hl_group = hl_group
--       return vim_item
--     end
--   end
--   return lspkind.cmp_format({ with_text = false })(entry, vim_item)
-- end

-- vim.o.completeopt = "menu,menuone,noselect"
-- local cmp_window = require "cmp.utils.window"
-- cmp_window.info_ = cmp_window.info
-- cmp_window.info = function(self)
--   local info = self:info_()
--   info.scrollable = true
--   return info
-- end

local snippet = {
  expand = function(args)
    require("luasnip").lsp_expand(args.body)
  end
}

local window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
}

local mapping = {
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<C-n>"] = cmp.mapping.select_next_item(),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif HasWordsBefore() then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
}


cmp.setup {
  snippet = snippet,
  window = window,
  formatting = { format = Format },
  enabled = Enabled,
  mapping = mapping,

  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}
