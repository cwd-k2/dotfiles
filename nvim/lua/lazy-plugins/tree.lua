local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help,     opts('Help'))
  vim.keymap.set('n', 'v', api.node.open.vertical,   opts('Split vertically'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Split horizontally'))
end

local function config()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  vim.cmd [[
  nnoremap <silent> <leader>f <cmd>NvimTreeToggle<CR>
  ]]

  require('nvim-tree').setup {
    view = {
      width = 35,
    },
    on_attach = on_attach,
  }
end

return {
  'nvim-tree/nvim-tree.lua',
  config = config,
}
