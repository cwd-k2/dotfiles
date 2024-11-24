return {
  lsp = "denols",
  setup = {
    on_attach = function(client)
      if require("lspconfig.util").root_pattern("package.json")(vim.fn.getcwd()) then
        client.stop(true)
      end
    end,
    single_file_support = true,
    filetypes = { "javascript", "typescript" }
  },
}
