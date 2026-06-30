vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.diagnostic.config({ virtual_text = false, underline = false })
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.diagnostic.config({ virtual_text = true, underline = true })
	end,
})
