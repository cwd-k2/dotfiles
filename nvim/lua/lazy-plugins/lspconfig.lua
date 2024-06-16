local setups = {
  hls = {
    settings = {
      haskell = {
        formattingProvider = "stylish-haskell"
      },
    },
  },

  clangd = {},

  rust_analyzer = {
    settings = {
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
    }
  },

  gopls = {},

  tsserver = {
    settings = {
      completions = { completeFunctionCalls = true }
    },
  },

  lua_ls = {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
        return
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT'
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          },
        },
      })
    end,
    settings = {
      Lua = {}
    },
  },

  vimls = {},
}

local noformats = {
  "tsserver",
  "gopls",
  "lua_ls",
}

local function included(element, table)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

local function on_attach(fn)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      fn(client, buffer)
    end,
  })
end

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

local function attached(client, buffer)
  local bufopts = { noremap = true, silent = true, buffer = buffer }
  vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
  vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)

  if client.supports_method("textDocument/formatting") then
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local fmtopts = {
      async = false,
      filter = function(c)
        return not included(c.name, noformats)
      end,
    }

    vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = buffer,
      callback = function()
        vim.lsp.buf.format(fmtopts)
      end,
    })
  end
end

local function config()
  local lspconfig = require('lspconfig')
  local capabilities = build_capabilities()

  on_attach(attached)

  for lps, conf in pairs(setups) do
    conf.capabilities = capabilities
    lspconfig[lps].setup(conf)
  end

  local null = require('null-ls')
  null.setup {
    sources = {
      null.builtins.formatting.prettierd,
      null.builtins.formatting.goimports,
    }
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
    {
      'nvimtools/none-ls.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
  }
}
