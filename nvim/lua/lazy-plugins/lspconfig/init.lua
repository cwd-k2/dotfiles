local lspsetups = {
  require("lazy-plugins.lspconfig.hls"),
  require("lazy-plugins.lspconfig.rust_analyzer"),
  require("lazy-plugins.lspconfig.clangd"),
  require("lazy-plugins.lspconfig.gopls"),
  require("lazy-plugins.lspconfig.vimls"),
  require("lazy-plugins.lspconfig.lua_ls"),
  require("lazy-plugins.lspconfig.tsserver"),
  require("lazy-plugins.lspconfig.volar"),
}

local noformats = {
  "gopls",
  "lua_ls",
  "ts_ls",
  "volar",
}

local function included(element, table)
  for _, value in ipairs(table) do
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

local function attached(client, buffer)
  local bufopts = { noremap = true, silent = true, buffer = buffer }
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
  vim.keymap.set('n', '<C-K>', '<cmd>lua vim.diagnostic.open_float(nil, { focusable = true })<CR>', bufopts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
  vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)

  if client.supports_method("textDocument/codeLens") then
    local augroup = vim.api.nvim_create_augroup("LspCodeLens", {})

    vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "InsertLeave" }, {
      group = augroup,
      buffer = buffer,
      callback = function()
        vim.lsp.codelens.refresh()
      end,
    })
  end

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
  local capabilities = require('lazy-plugins.lspconfig.capabilities').build()
  on_attach(attached)

  for _, lspsetup in ipairs(lspsetups) do
    lspsetup.setup.capabilities = capabilities
    require('lspconfig')[lspsetup.lsp].setup(lspsetup.setup)
  end

  local null = require('null-ls')
  null.setup {
    sources = {
      null.builtins.formatting.goimports,
      null.builtins.formatting.prettierd,
      require("none-ls.diagnostics.eslint_d").with {
        condition = function(utils)
          return utils.root_has_file({
            ".eslintrc.json",
            ".eslintrc.js",
            "eslint.config.js",
            "eslint.config.mjs",
            "eslint.config.cjs",
          })
        end
      }
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
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvimtools/none-ls-extras.nvim',
      },
    },
  },
}
