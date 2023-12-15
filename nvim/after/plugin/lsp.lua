local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({"tsserver", "eslint", "rust_analyzer", "pyright", "gopls"})
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({select = true}),
  ['<C-space>'] = cmp.mapping.complete(),
})
lsp.setup_nvim_cmp({mapping = cmp_mappings})
lsp.on_attach(function(client, bufnr)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<leader>ren", function() vim.lsp.buf.rename() end, opts)
end)
lsp.setup()
