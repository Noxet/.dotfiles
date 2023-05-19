local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
	'rust_analyzer',
    'clangd'
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

