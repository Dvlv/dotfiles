
-- cmp
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

--- icons
local kind_icons = {
  Text = "🖋️",
  Method = "🔧",
  Function = "⚱",
  Constructor = "🔨",
  Field = "🌲",
  Variable = "📦",
  Class = "🎙",
  Interface = "🖥",
  Module = "🖥",
  Property = "🏠",
  Unit = "🦄",
  Value = "💸",
  Enum = "🔢",
  Keyword = "🔑",
  Snippet = "✂️",
  Color = "🍫",
  File = "📂",
  Reference = "📽",
  Folder = "📁",
  EnumMember = "🔢",
  Constant = "🏗",
  Struct = "🏢",
  Event = "🥳",
  Operator = "🔬",
  TypeParameter = "🆎"
}

-- setup

local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  sources = cmp.config.sources({
    {name = "nvim_lsp", keyword_length=2},
    {name="luasnip"},
    {name = "buffer", keyword_length=4},
  }),
  mapping = {
    ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
          cmp.confirm()
        else
          fallback()
        end
      end
    end,

    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
          cmp.confirm()
        else
          fallback()
        end
      end
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) 
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
  experimental = {
    ghost_text = true,
  },
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- lang servers
--
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-t>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

require'lspconfig'.pyright.setup{
    on_attach = on_attach,
    flags = {
    -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
}

local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'    
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "css", "typescriptreact", "javascriptreact", "htmldjango", "scss", "less"},
})

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

