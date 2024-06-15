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
  },
  {
    'LeafCage/yankround.vim',
    config = function()
      vim.g.yankround_dir = vim.fn.stdpath('cache') .. '/yankround'
      vim.g.yankround_max_history = 100

      vim.cmd [[
      nmap <nowait> p <Plug>(yankround-p)
      nmap <nowait> P <Plug>(yankround-P)
      nmap <nowait> <C-p> <Plug>(yankround-prev)
      nmap <nowait> <C-n> <Plug>(yankround-next)
      ]]
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  }
}
