local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return print("LSP config failed to load!")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end

local mason_lspconfig = require("mason-lspconfig")

local servers = {
  "lua_ls",
  "pyright",
  "jdtls",
  "html",
  "ts_ls",
}

mason_lspconfig.setup({
  ensure_installed = servers,
})

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
})
