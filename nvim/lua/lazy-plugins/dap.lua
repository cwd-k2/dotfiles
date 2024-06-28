return {
  {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
    init = function()
      vim.cmd [[
      nnoremap <silent> <C-j> <cmd>lua require("dap").toggle_breakpoint()<cr>
      nnoremap <silent> <C-m> <cmd>lua require("dap").continue()<cr>
      nnoremap <silent> <C-i> <cmd>lua require("dap").step_into()<cr>
      nnoremap <silent> <C-o> <cmd>lua require("dap").step_over()<cr>
      ]]
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {
      highlight_new_as_changed = true,
      virt_text_pos = "eol",
      virt_lines = true,
    },
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    event = "VeryLazy",
    opts = {
      mappings = {
        open = "O",
        expand = { "o" },
      },
    },
    init = function()
      vim.cmd [[
      nnoremap <silent><C-,> <cmd>lua require("dapui").eval()<CR>
      nnoremap <leader>du <cmd>lua require("dapui").toggle()<CR>
      ]]
    end,
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    },
  },
  {
    'leoluz/nvim-dap-go',
    ft = 'go',
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      delve = {
        initialize_timeout_sec = 20,
        port = "${port}",
        args = {},
        build_flags = "",
        detached = true,
        cwd = nil,
      },
    },
    dependencies = {
      'mfussenegger/nvim-dap',
    },
  },
}
