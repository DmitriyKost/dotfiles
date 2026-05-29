require("config.lazy").plugin({
	src = "https://github.com/hat0uma/csvview.nvim",
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	ft = { "csv", "tsv" },
	config = function()
		require("csvview").setup({
			parser = { delimiter = "," },
			view = { display_mode = "highlight" },
		})
	end,
	on_ft = function()
		vim.cmd("CsvViewEnable")
	end,
})
