vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		vim.lsp.start({
			name = "tsserver",
			cmd = { "typescript-language-server", "--stdio" },
			root_dir = vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json", ".git" }, { upward = true })[1]),
		})
	end,
})
