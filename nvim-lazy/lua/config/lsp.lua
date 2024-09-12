local lsp_zero = require('lsp-zero')

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- For managing cross compilers and correct include paths with clangd
-- see here: https://www.reddit.com/r/avr/comments/1c3080u/comment/kzfnj29/
-- TODO: add support for multiple cross compilers, where we select which one using a local .clangd file in the project
local handle = io.popen("which arm-none-eabi-gcc")
local arm_gcc
if handle then
	arm_gcc = handle:read("*a"):sub(1, -2)
	handle:close()
else
	arm_gcc = nil;
end


local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.clangd.setup {
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd", arm_gcc and "--query-driver=" .. arm_gcc },
}
