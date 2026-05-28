vim.api.nvim_create_autocmd("VimLeave", {
	group = vim.api.nvim_create_augroup("reset_cursor_on_exit", { clear = true }),
	callback = function()
		vim.opt.guicursor = "a:ver25"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "csv", "tsv" },
	callback = function()
		vim.cmd.packadd("csvview.nvim")
		require("csvview").setup({
			parser = { delimiter = "," },
			view = { display_mode = "highlight" },
		})
		require("csvview").enable()
	end,
})
