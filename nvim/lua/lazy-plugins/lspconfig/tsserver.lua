return {
  lsp = "tsserver",
  setup = {
    settings = {
      completions = { completeFunctionCalls = true }
    },
    on_new_config = function(config, root)
      if require("lspconfig.util").root_pattern("vite.config.ts", "nuxt.config.ts")(root) then
        config.init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = require('npm').which("@vue/typescript-plugin"),
              languages = { "javascript", "typescript", "vue" },
            },
          }
        }
      end
    end,
    filetypes = { "javascript", "typescript", "vue" }
  },
}
