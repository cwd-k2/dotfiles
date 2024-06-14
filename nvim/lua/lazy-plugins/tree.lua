local function config()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  vim.cmd [[
  nnoremap <silent> <leader>f <cmd>NvimTreeToggle<CR>
  ]]

  require('nvim-tree').setup {
    view = {
      width = 40,
    }
  }
end

return {
  'nvim-tree/nvim-tree.lua',
  config = config,
}
