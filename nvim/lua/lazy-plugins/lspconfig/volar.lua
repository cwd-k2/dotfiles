return {
  lsp = "volar",
  setup = {
    on_new_config = function(config, _)
      config.init_options.typescript.tsdk = require('npm').which("typescript/lib")
    end,
  },
}
