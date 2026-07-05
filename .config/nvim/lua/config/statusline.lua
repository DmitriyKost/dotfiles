local M = {}

local c = {
	normal = "#68B0FF",
	insert = "#8AFF80",
	visual = "#C792EA",
	replace = "#FF5874",
	command = "#FFCB6B",
	terminal = "#4CD5C3",
}

local mode_map = {
	n = { "NORMAL", "St_NormalMode" },
	i = { "INSERT", "St_InsertMode" },
	ic = { "INSERT", "St_InsertMode" },
	ix = { "INSERT", "St_InsertMode" },

	v = { "VISUAL", "St_VisualMode" },
	V = { "V-LINE", "St_VisualMode" },
	["\22"] = { "V-BLOCK", "St_VisualMode" },

	s = { "SELECT", "St_VisualMode" },
	S = { "S-LINE", "St_VisualMode" },
	["\19"] = { "S-BLOCK", "St_VisualMode" },

	R = { "REPLACE", "St_ReplaceMode" },
	Rv = { "V-REPLACE", "St_ReplaceMode" },

	c = { "COMMAND", "St_CommandMode" },
	cv = { "COMMAND", "St_CommandMode" },
	ce = { "COMMAND", "St_CommandMode" },

	r = { "PROMPT", "St_CommandMode" },
	rm = { "MORE", "St_CommandMode" },
	["r?"] = { "CONFIRM", "St_CommandMode" },

	t = { "TERMINAL", "St_TerminalMode" },
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local function hl_fg(group, fallback)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })

	if ok and hl and hl.fg then
		return string.format("#%06x", hl.fg)
	end

	return fallback
end

local function hl_bg(group, fallback)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })

	if ok and hl and hl.bg then
		return string.format("#%06x", hl.bg)
	end

	return fallback
end

function M.setup_highlights()
	local bg = hl_bg("Normal", "NONE")

	hi("StatusLine", { bg = bg })
	hi("StatusLineNC", { bg = bg })

	hi("St_NormalMode", { fg = hl_fg("St_NormalMode", c.normal), bg = bg, bold = true })
	hi("St_InsertMode", { fg = hl_fg("St_InsertMode", c.insert), bg = bg, bold = true })
	hi("St_VisualMode", { fg = hl_fg("St_VisualMode", c.visual), bg = bg, bold = true })
	hi("St_ReplaceMode", { fg = hl_fg("St_ReplaceMode", c.replace), bg = bg, bold = true })
	hi("St_CommandMode", { fg = hl_fg("St_CommandMode", c.command), bg = bg, bold = true })
	hi("St_TerminalMode", { fg = hl_fg("St_TerminalMode", c.terminal), bg = bg, bold = true })
end

local function mode()
	local m = vim.fn.mode(1)
	local entry = mode_map[m] or mode_map[m:sub(1, 1)] or { m, "St_NormalMode" }
	local label, hl = entry[1], entry[2]

	return string.format("%%#%s# %s ", hl, label)
end

function M.render()
	return mode()
end

function M.setup()
	M.setup_highlights()

	vim.o.statusline = "%!v:lua.require('config.statusline').render()"

	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("StatuslineTheme", { clear = true }),
		callback = M.setup_highlights,
	})

	vim.api.nvim_create_autocmd("ModeChanged", {
		group = vim.api.nvim_create_augroup("StatuslineRedraw", { clear = true }),
		callback = function()
			vim.cmd("redrawstatus")
		end,
	})
end

return M
