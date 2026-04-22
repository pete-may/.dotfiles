vim.lsp.config('gopls', {
  cmd = {'gopls'},
  filetypes = {'go'},
})

vim.lsp.enable('gopls')



-- require("lspconfig").gopls.setup({})
