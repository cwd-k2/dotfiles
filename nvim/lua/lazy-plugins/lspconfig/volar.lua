return {
  lsp = "volar",
  setup = {
    on_new_config = function(config, root)
      config.init_options.typescript.tsdk = require('npm').which(root, "typescript/lib")
    end,
  },
}
