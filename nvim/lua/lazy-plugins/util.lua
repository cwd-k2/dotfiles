return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      check_ts = true,
    }
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'ntpeters/vim-better-whitespace',
    config = function()
      vim.cmd [[
      let g:better_whitespace_enabled = 1
      let g:better_whitespace_filetypes_blacklist = [
      \ 'conf',
      \ ]
      let g:strip_whitespace_on_save  = 1
      let g:strip_whitespace_confirm  = 0
      ]]
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  }
}
