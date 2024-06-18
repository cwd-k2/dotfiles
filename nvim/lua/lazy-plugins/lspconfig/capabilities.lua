local function build_capabilities()
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>']     = cmp.mapping.scroll_docs(-4),
      ['<C-f>']     = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-g>']     = cmp.mapping.abort(),
      ['<CR>']      = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources(
      {
        { name = 'buffer' },
      },
      {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
      })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        { name = 'cmdline' }
      },
      {
        { name = 'path' }
      }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  return require('cmp_nvim_lsp').default_capabilities()
end

return {
  build = build_capabilities
}
