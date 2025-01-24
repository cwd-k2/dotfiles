return {
  lsp = "ts_ls",
  setup = {
    settings = {
      completions = { completeFunctionCalls = true }
    },
    on_new_config = function(config, root)
      if require("lspconfig.util").root_pattern(
        "vite.config.js", "vite.config.ts", "vite.config.mjs", "vite.config.mts",
        "nuxt.config.js", "nuxt.config.ts", "nuxt.config.mjs", "nuxt.config.mts")(root) then
        config.init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = require('npm').which(root, "@vue/typescript-plugin"),
              languages = { "javascript", "typescript", "vue" },
            },
          }
        }
      end
    end,
    on_attach = function(client)
      if not require("lspconfig.util").root_pattern("package.json")(vim.fn.getcwd()) then
        client.stop(true)
      end
    end,
    single_file_support = false,
    filetypes = { "javascript", "typescript", "vue" }
  },
}
