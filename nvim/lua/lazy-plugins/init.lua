local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  require('lazy-plugins/ui'),
  require('lazy-plugins/util'),
  require('lazy-plugins/tree'),
  require('lazy-plugins/lspconfig'),
  require('lazy-plugins/telescope'),
  require('lazy-plugins/treesitter'),
}

require('lazy').setup(plugins)
