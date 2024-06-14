local function setup_cmp()
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
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
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
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
end

local function config()
  setup_cmp()

  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local function on_attach(fn)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local buffer = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        fn(client, buffer)
      end,
    })
  end

  on_attach(function(client, buffer)
    local bufopts = { noremap = true, silent = true, buffer = buffer }
    vim.keymap.set('n', '<C-k>',     '<cmd>lua vim.lsp.buf.hover()<CR>',          bufopts)
    vim.keymap.set('n', 'gd',        '<cmd>lua vim.lsp.buf.definition()<CR>',     bufopts)
    vim.keymap.set('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
    vim.keymap.set('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>',     bufopts)
    vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>',         bufopts)

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = buffer,
        callback = function()
          vim.lsp.buf.format({
            async = false, -- filter: function で除外する lsp 指定可能
          })
        end,
      })
    end
  end)

  lspconfig.hls.setup {
    settings = {
      formattingProvider = "stylish-haskell"
    },
    capabilities = capabilities,
  }

  lspconfig.clangd.setup {}

  lspconfig.rust_analyzer.setup {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
    },
    capabilities = capabilities
  }

  lspconfig.tsserver.setup {
    settings = {
      completions = {
        completeFunctionCalls = true,
      }
    },
    capabilities = capabilities
  }
end

return {
  'neovim/nvim-lspconfig',
  config = config,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }
}
