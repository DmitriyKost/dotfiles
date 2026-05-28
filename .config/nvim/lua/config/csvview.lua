local loaded = false
local lazy_commands = {
	"CsvViewEnable",
	"CsvViewDisable",
	"CsvViewToggle",
}

local function load_csvview()
	if loaded then
		return
	end

	vim.cmd.packadd("csvview.nvim")
	require("csvview").setup()

	loaded = true
end

local function delete_lazy_commands()
	for _, cmd in ipairs(lazy_commands) do
		pcall(vim.api.nvim_del_user_command, cmd)
	end
end

local function call_csvview_command(cmd, opts)
	load_csvview()
	delete_lazy_commands()

	local suffix = opts.args ~= "" and (" " .. opts.args) or ""
	vim.cmd(cmd .. suffix)
end

for _, cmd in ipairs(lazy_commands) do
	vim.api.nvim_create_user_command(cmd, function(opts)
		call_csvview_command(cmd, opts)
	end, { nargs = "*" })
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "csv", "tsv" },
	callback = function()
		load_csvview()
		vim.cmd("CsvViewEnable")
	end,
})
