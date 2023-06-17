local lsp = require('lsp-zero')
local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
    --- you can add more stuff here if you need it
  end,
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.lua_format,
    null_ls.builtins.formatting.dprint
  }
})
