return {
  lsp = "rust_analyzer",
  setup = {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          allFeatures = true,
        },
        procMacro = {
          enable = true,
        },
      },
    }
  },
}
