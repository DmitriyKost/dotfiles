local specs = {
	{
		src = "https://github.com/tpope/vim-dadbod",
		name = "vim-dadbod",
	},
	{
		src = "https://github.com/kristijanhusak/vim-dadbod-ui",
		name = "vim-dadbod-ui",
	},
	{
		src = "https://github.com/kristijanhusak/vim-dadbod-completion",
		name = "vim-dadbod-completion",
	},
}
local loaded = false
local lazy_commands = {
	"DB",
	"DBUI",
	"DBUIToggle",
	"DBUIAddConnection",
	"DBUIFindBuffer",
	"DBUILastQueryInfo",
}

local function setup_globals()
	vim.g.db_ui_use_nerd_fonts = 1
	vim.g.db_ui_show_help = 0
	vim.g.db_ui_winwidth = 40
	vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui"

	vim.g.db_ui_auto_execute_table_helpers = 0

	vim.g.db_ui_default_query = "select * from {table} limit 100"

	pcall(require, "config.local")
end

local function delete_lazy_commands()
	for _, cmd in ipairs(lazy_commands) do
		pcall(vim.api.nvim_del_user_command, cmd)
	end
end

local function load_dadbod()
	if loaded then
		return
	end

	setup_globals()

	vim.pack.add(specs, { load = false })

	delete_lazy_commands()

	vim.cmd.packadd("vim-dadbod")
	vim.cmd.packadd("vim-dadbod-ui")
	vim.cmd.packadd("vim-dadbod-completion")

	loaded = true
end

local function call_dadbod_command(cmd, opts)
	load_dadbod()

	local suffix = opts.args ~= "" and (" " .. opts.args) or ""
	vim.cmd(cmd .. suffix)
end

for _, cmd in ipairs(lazy_commands) do
	vim.api.nvim_create_user_command(cmd, function(opts)
		call_dadbod_command(cmd, opts)
	end, {
		nargs = "*",
		bang = true,
		complete = "file",
	})
end

vim.keymap.set("n", "<leader>du", function()
	load_dadbod()
	vim.cmd("DBUIToggle")
end, { desc = "Toggle DB UI" })

vim.keymap.set("n", "<leader>da", function()
	load_dadbod()
	vim.cmd("DBUIAddConnection")
end, { desc = "Add DB connection" })

vim.keymap.set("n", "<leader>df", function()
	load_dadbod()
	vim.cmd("DBUIFindBuffer")
end, { desc = "Find DB buffer" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sql", "mysql", "plsql" },
	callback = function()
		load_dadbod()
		vim.bo.omnifunc = "vim_dadbod_completion#omni"
	end,
})
