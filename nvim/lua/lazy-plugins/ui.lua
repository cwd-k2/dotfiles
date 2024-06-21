return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      {
        'NStefan002/screenkey.nvim',
        init = function()
          vim.g.screenkey_statusline_component = true
        end,
        config = true,
      },
    },
    opts = {
      sections = {
        lualine_z = {
          function()
            return require("screenkey").get_keys()
          end,
          'filename',
        },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    'folke/tokyonight.nvim',
    init = function()
      vim.cmd [[
      colorscheme tokyonight-night
      ]]
    end,
    lazy = false,
    priority = 1000,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    opts = {},
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
}
