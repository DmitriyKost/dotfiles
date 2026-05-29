require("config.lazy").plugin({
	src = {
		"https://github.com/tpope/vim-dadbod",
		"https://github.com/kristijanhusak/vim-dadbod-ui",
		"https://github.com/kristijanhusak/vim-dadbod-completion",
	},
	cmd = {
		"DB",
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
		"DBUILastQueryInfo",
	},
	command_opts = {
		nargs = "*",
		bang = true,
		complete = "file",
	},
	ft = { "sql", "mysql", "plsql" },
	keys = {
		{ "<leader>du", "DBUIToggle", desc = "Toggle DB UI" },
		{ "<leader>da", "DBUIAddConnection", desc = "Add DB connection" },
		{ "<leader>df", "DBUIFindBuffer", desc = "Find DB buffer" },
	},
	config = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_show_help = 0
		vim.g.db_ui_winwidth = 40
		vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui"
		vim.g.db_ui_auto_execute_table_helpers = 0
		vim.g.db_ui_default_query = "select * from {table} limit 100"

		pcall(require, "config.local")
	end,
	on_ft = function()
		vim.bo.omnifunc = "vim_dadbod_completion#omni"
	end,
})
