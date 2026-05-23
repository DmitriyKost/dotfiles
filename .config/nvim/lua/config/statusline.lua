local M = {}

local c = {
	bg = "#10131B",
	fg = "#D6DEEB",

	normal = "#68B0FF",
	insert = "#8AFF80",
	visual = "#C792EA",
	replace = "#FF5874",
	command = "#FFCB6B",
	terminal = "#4CD5C3",

	diag_error = "#FF5874",
	diag_warn = "#FFD580",
	diag_info = "#68B0FF",
	diag_hint = "#4CD5C3",

	git = "#B4BEFE",
	subtle = "#5A6272",
	lsp = "#4CD5C3",
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
	local bg = hl_bg("StatusLine", c.bg)

	hi("St_NormalMode", { fg = hl_fg("St_NormalMode", c.normal), bg = bg, bold = true })
	hi("St_InsertMode", { fg = hl_fg("St_InsertMode", c.insert), bg = bg, bold = true })
	hi("St_VisualMode", { fg = hl_fg("St_VisualMode", c.visual), bg = bg, bold = true })
	hi("St_ReplaceMode", { fg = hl_fg("St_ReplaceMode", c.replace), bg = bg, bold = true })
	hi("St_CommandMode", { fg = hl_fg("St_CommandMode", c.command), bg = bg, bold = true })
	hi("St_TerminalMode", { fg = hl_fg("St_TerminalMode", c.terminal), bg = bg, bold = true })

	hi("St_File", { fg = hl_fg("Normal", c.fg), bg = bg })
	hi("St_Git", { fg = hl_fg("Identifier", c.git), bg = bg })
	hi("St_DiagError", { fg = hl_fg("DiagnosticError", c.diag_error), bg = bg })
	hi("St_DiagWarn", { fg = hl_fg("DiagnosticWarn", c.diag_warn), bg = bg })
	hi("St_DiagInfo", { fg = hl_fg("DiagnosticInfo", c.diag_info), bg = bg })
	hi("St_DiagHint", { fg = hl_fg("DiagnosticHint", c.diag_hint), bg = bg })
	hi("St_Lsp", { fg = hl_fg("DiagnosticHint", c.lsp), bg = bg, bold = true })
	hi("St_Pos", { fg = hl_fg("Normal", c.fg), bg = bg })
end

local function mode()
	local m = vim.fn.mode(1)

	local entry = mode_map[m] or mode_map[m:sub(1, 1)] or { m, "St_File" }
	local label, hl = entry[1], entry[2]

	return string.format("%%#%s# %-8s ", hl, label)
end

local function file()
	local name = vim.fn.expand("%:t")
	if name == "" then
		name = "[No Name]"
	end

	local modified = vim.bo.modified and " [+]" or ""
	local readonly = vim.bo.readonly and " [-]" or ""

	return "%#St_File# " .. name .. modified .. readonly .. " "
end

local function git()
	local gitsigns = vim.b.gitsigns_status_dict
	if not gitsigns or not gitsigns.head or gitsigns.head == "" then
		return ""
	end

	return "%#St_Git#  " .. gitsigns.head .. " "
end

local function diagnostics()
	local bufnr = 0
	local e = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
	local w = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
	local i = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })
	local h = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })

	local parts = {}

	if e > 0 then
		table.insert(parts, "%#St_DiagError#E " .. e)
	end
	if w > 0 then
		table.insert(parts, "%#St_DiagWarn#W " .. w)
	end
	if i > 0 then
		table.insert(parts, "%#St_DiagInfo#I " .. i)
	end
	if h > 0 then
		table.insert(parts, "%#St_DiagHint#H " .. h)
	end

	if #parts == 0 then
		return ""
	end

	return " " .. table.concat(parts, " ") .. " "
end

local function lsp()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if not clients or #clients == 0 then
		return ""
	end

	return "%#St_Lsp#  "
end

local function position()
	local line = vim.fn.line(".")
	local col = vim.fn.virtcol(".")
	return string.format("%%#St_Pos# %4d:%-3d ", line, col)
end

function M.render()
	return table.concat({
		mode(),
		file(),
		git(),
		"%=",
		diagnostics(),
		lsp(),
		position(),
	})
end

function M.setup()
	M.setup_highlights()
	vim.o.statusline = "%!v:lua.require('config.statusline').render()"

	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("StatuslineTheme", { clear = true }),
		callback = M.setup_highlights,
	})

	vim.api.nvim_create_autocmd({
		"ModeChanged",
		"BufEnter",
		"BufWritePost",
		"DiagnosticChanged",
		"LspAttach",
		"LspDetach",
	}, {
		group = vim.api.nvim_create_augroup("StatuslineRedraw", { clear = true }),
		callback = function()
			vim.cmd("redrawstatus")
		end,
	})
end

return M
