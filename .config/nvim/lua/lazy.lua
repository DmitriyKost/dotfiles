local M = {}

local function once(fn)
	local done = false
	return function()
		if done then
			return
		end
		done = true
		fn()
	end
end

local function pkg_name(src)
	return (src:gsub("%.git$", ""):match("([^/]+)$"))
end

local function normalize_sources(src)
	if type(src) == "string" then
		src = { src }
	end

	local specs, names = {}, {}

	for _, entry in ipairs(src) do
		local spec

		if type(entry) == "table" then
			spec = vim.tbl_extend("force", {}, entry)
			spec.name = spec.name or pkg_name(spec.src)
		else
			spec = {
				src = entry,
				name = pkg_name(entry),
			}
		end

		table.insert(specs, spec)
		table.insert(names, spec.name)
	end

	return specs, names
end

local function command_suffix(opts)
	local bang = opts.bang and "!" or ""
	local args = opts.args ~= "" and (" " .. opts.args) or ""
	return bang .. args
end

-- Declaratively register a lazily-loaded plugin.
--
-- spec fields:
--   src         string | list of (string | { src, name }) -- plugin source(s)
--   cmd         list of command names that trigger loading
--   ft          filetype pattern(s) that trigger loading
--   keys        list of { lhs, action, mode?, desc? }; action is a command
--               string or a function
--   config      function run once, after the plugin(s) are loaded
--   on_ft       function run after loading when an `ft` trigger fires
--   command_opts options table for the stub commands (default { nargs = "*" })
function M.plugin(spec)
	local specs, names = normalize_sources(spec.src)
	local cmds = spec.cmd or {}

	local load = once(function()
		-- Drop our stubs first so the plugin's real commands replace them
		-- cleanly (some share a name with the stub, e.g. `Opencode`).
		for _, cmd in ipairs(cmds) do
			pcall(vim.api.nvim_del_user_command, cmd)
		end

		vim.pack.add(specs, { load = false })
		for _, name in ipairs(names) do
			vim.cmd.packadd(name)
		end

		if spec.config then
			spec.config()
		end
	end)

	local command_opts = spec.command_opts or { nargs = "*" }
	for _, cmd in ipairs(cmds) do
		vim.api.nvim_create_user_command(cmd, function(opts)
			load()
			vim.cmd(cmd .. command_suffix(opts))
		end, command_opts)
	end

	if spec.ft then
		vim.api.nvim_create_autocmd("FileType", {
			pattern = spec.ft,
			callback = function()
				load()
				if spec.on_ft then
					spec.on_ft()
				end
			end,
		})
	end

	for _, key in ipairs(spec.keys or {}) do
		local lhs, action = key[1], key[2]
		vim.keymap.set(key.mode or "n", lhs, function()
			load()
			if type(action) == "function" then
				action()
			else
				vim.cmd(action)
			end
		end, { desc = key.desc })
	end

	return load
end

return M
