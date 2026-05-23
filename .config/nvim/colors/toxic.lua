if vim.g.colors_name then
	vim.cmd("hi clear")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "toxic"

local M = {}

M.base_30 = {
	white = "#D6DEEB",
	darker_black = "#0E1116",
	black = "#0F111A",
	black2 = "#181B22",
	one_bg = "#1E212A",
	one_bg2 = "#242833",
	one_bg3 = "#2A2F3A",
	grey = "#3A3F4B",
	grey_fg = "#444B57",
	grey_fg2 = "#4E5563",
	light_grey = "#5A6272",

	red = "#FF5874",
	baby_pink = "#FF7C99",
	pink = "#F7768E",

	line = "#1A1D26",

	green = "#8AFF80",
	vibrant_green = "#A7FF57",

	nord_blue = "#82AAFF",
	blue = "#68B0FF",

	yellow = "#FFD580",
	sun = "#FFE58F",

	purple = "#C792EA",
	dark_purple = "#B480D6",

	teal = "#4CD5C3",
	orange = "#FFCB6B",
	cyan = "#89DDFF",

	statusline_bg = "#10131B",
	lightbg = "#1B1E27",
	pmenu_bg = "#B4BEFE",
	folder_bg = "#68B0FF",
	lavender = "#B4BEFE",
}

M.base_16 = {
	base00 = "#0F111A",
	base01 = "#181B22",
	base02 = "#1E212A",
	base03 = "#2A2F3A",
	base04 = "#444B57",
	base05 = "#D6DEEB",
	base06 = "#E6EDF3",
	base07 = "#F1F5FA",
	base08 = "#FF5874",
	base09 = "#FFCB6B",
	base0A = "#FFD580",
	base0B = "#8AFF80",
	base0C = "#4CD5C3",
	base0D = "#68B0FF",
	base0E = "#C792EA",
	base0F = "#5EEAD4",
}

local c = M.base_30
local b = M.base_16

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local groups = {
	-- base editor
	Normal = { fg = c.white, bg = c.black },
	NormalNC = { fg = c.white, bg = c.black },
	NormalFloat = { fg = c.white, bg = c.black },
	FloatBorder = { fg = c.line, bg = c.black },
	FloatTitle = { fg = c.blue, bg = c.black, bold = true },

	Cursor = { fg = c.black, bg = c.white },
	lCursor = { fg = c.black, bg = c.white },
	CursorIM = { fg = c.black, bg = c.white },

	CursorLine = { bg = c.one_bg },
	CursorLineNr = { fg = c.yellow, bold = true },
	CursorColumn = { bg = c.one_bg },
	ColorColumn = { bg = c.one_bg },

	LineNr = { fg = c.grey_fg2 },
	SignColumn = { fg = c.grey_fg, bg = c.black },
	FoldColumn = { fg = c.grey_fg, bg = c.black },
	Folded = { fg = c.grey_fg, bg = c.lightbg },

	Visual = { bg = c.one_bg3 },
	VisualNOS = { bg = c.one_bg3 },

	Search = { fg = c.black, bg = c.yellow },
	IncSearch = { fg = c.black, bg = c.orange },
	CurSearch = { fg = c.black, bg = c.orange },

	MatchParen = { fg = c.sun, bg = c.one_bg2, bold = true },

	Pmenu = { fg = c.white, bg = c.black },
	PmenuSel = { fg = c.black, bg = c.pmenu_bg, bold = true },
	PmenuSbar = { bg = c.one_bg },
	PmenuThumb = { bg = c.grey },

	StatusLine = { fg = c.white, bg = c.statusline_bg },
	StatusLineNC = { fg = c.grey_fg, bg = c.statusline_bg },

	TabLine = { fg = c.grey_fg, bg = c.one_bg },
	TabLineFill = { fg = c.grey_fg, bg = c.black },
	TabLineSel = { fg = c.white, bg = c.one_bg3, bold = true },

	WinSeparator = { fg = c.line },
	VertSplit = { fg = c.line },

	Directory = { fg = c.folder_bg, bold = true },
	Title = { fg = c.blue, bold = true },

	ErrorMsg = { fg = c.red, bold = true },
	WarningMsg = { fg = c.yellow, bold = true },
	MoreMsg = { fg = c.green, bold = true },
	Question = { fg = c.green, bold = true },

	NonText = { fg = c.grey },
	SpecialKey = { fg = c.grey },
	Whitespace = { fg = c.grey },
	EndOfBuffer = { fg = c.black },

	Conceal = { fg = c.grey_fg },
	Ignore = { fg = c.grey_fg },

	QuickFixLine = { bg = c.one_bg2, bold = true },

	-- syntax
	Comment = { fg = c.light_grey, italic = true },

	Constant = { fg = c.orange },
	String = { fg = c.green },
	Character = { fg = c.green },
	Number = { fg = c.orange },
	Boolean = { fg = c.orange, bold = true },
	Float = { fg = c.orange },

	Identifier = { fg = c.lavender },
	Function = { fg = c.blue },

	Statement = { fg = c.purple },
	Conditional = { fg = c.purple },
	Repeat = { fg = c.purple },
	Label = { fg = c.purple },
	Operator = { fg = c.cyan },
	Keyword = { fg = c.purple },
	Exception = { fg = c.red },

	PreProc = { fg = c.red },
	Include = { fg = c.purple },
	Define = { fg = c.purple },
	Macro = { fg = c.red },
	PreCondit = { fg = c.red },

	Type = { fg = c.yellow },
	StorageClass = { fg = c.yellow },
	Structure = { fg = c.yellow },
	Typedef = { fg = c.yellow },

	Special = { fg = c.teal },
	SpecialChar = { fg = c.teal },
	Tag = { fg = c.blue },
	Delimiter = { fg = c.white },
	SpecialComment = { fg = c.grey_fg },
	Debug = { fg = c.red },

	Underlined = { underline = true },
	Bold = { bold = true },
	Italic = { italic = true },

	Error = { fg = c.red, bold = true },
	Todo = { fg = c.black, bg = c.yellow, bold = true },

	-- diagnostics
	DiagnosticError = { fg = c.red },
	DiagnosticWarn = { fg = c.yellow },
	DiagnosticInfo = { fg = c.blue },
	DiagnosticHint = { fg = c.teal },
	DiagnosticOk = { fg = c.green },

	DiagnosticVirtualTextError = { fg = c.red, bg = c.black2 },
	DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.black2 },
	DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.black2 },
	DiagnosticVirtualTextHint = { fg = c.teal, bg = c.black2 },

	DiagnosticUnderlineError = { sp = c.red, undercurl = true },
	DiagnosticUnderlineWarn = { sp = c.yellow, undercurl = true },
	DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
	DiagnosticUnderlineHint = { sp = c.teal, undercurl = true },

	DiagnosticFloatingError = { fg = c.red },
	DiagnosticFloatingWarn = { fg = c.yellow },
	DiagnosticFloatingInfo = { fg = c.blue },
	DiagnosticFloatingHint = { fg = c.teal },

	-- LSP references
	LspReferenceText = { bg = c.one_bg2 },
	LspReferenceRead = { bg = c.one_bg2 },
	LspReferenceWrite = { bg = c.one_bg2 },

	SignifySignAdd = { fg = c.green },
	SignifySignChange = { fg = c.yellow },
	SignifySignDelete = { fg = c.red },

	-- diff / git
	DiffAdd = { fg = c.green, bg = c.lightbg },
	DiffChange = { fg = c.yellow, bg = c.lightbg },
	DiffDelete = { fg = c.red, bg = c.lightbg },
	DiffText = { fg = c.blue, bg = c.one_bg2 },

	GitSignsAdd = { fg = c.green, bg = c.black },
	GitSignsChange = { fg = c.yellow, bg = c.black },
	GitSignsDelete = { fg = c.red, bg = c.black },

	gitcommitSummary = { fg = c.white },
	gitcommitComment = { fg = c.light_grey },
	gitcommitUntracked = { fg = c.light_grey },
	gitcommitDiscarded = { fg = c.light_grey },
	gitcommitSelected = { fg = c.light_grey },
	gitcommitUnmerged = { fg = c.red },
	gitcommitOnBranch = { fg = c.grey_fg },
	gitcommitArrow = { fg = c.grey_fg },
	gitcommitFile = { fg = c.blue },

	-- spell
	SpellBad = { sp = c.red, undercurl = true },
	SpellCap = { sp = c.blue, undercurl = true },
	SpellRare = { sp = c.purple, undercurl = true },
	SpellLocal = { sp = c.teal, undercurl = true },

	-- markdown
	markdownHeadingDelimiter = { fg = c.red, bold = true },
	markdownCode = { fg = c.green, bg = c.black },
	markdownCodeBlock = { fg = c.green, bg = c.black },
	markdownH1 = { fg = c.blue, bold = true },
	markdownH2 = { fg = c.purple, bold = true },
	markdownLinkText = { fg = c.blue, underline = true },
	markdownUrl = { fg = c.teal, underline = true },

	-- treesitter / captures
	["@annotation"] = { fg = c.teal },
	["@attribute"] = { fg = c.teal },
	["@boolean"] = { fg = c.orange, bold = true },
	["@character"] = { fg = c.green },
	["@character.special"] = { fg = c.teal },
	["@comment"] = { fg = c.light_grey, italic = true },
	["@conditional"] = { fg = c.purple },
	["@constant"] = { fg = c.orange },
	["@constant.builtin"] = { fg = c.orange },
	["@constant.macro"] = { fg = c.red },
	["@constructor"] = { fg = c.yellow },
	["@debug"] = { fg = c.red },
	["@define"] = { fg = c.purple },
	["@exception"] = { fg = c.red },
	["@field"] = { fg = c.teal },
	["@float"] = { fg = c.orange },
	["@function"] = { fg = c.blue },
	["@function.builtin"] = { fg = c.blue },
	["@function.call"] = { fg = c.blue },
	["@function.macro"] = { fg = c.red },
	["@include"] = { fg = c.purple },
	["@keyword"] = { fg = c.purple },
	["@keyword.function"] = { fg = c.purple },
	["@keyword.operator"] = { fg = c.cyan },
	["@keyword.return"] = { fg = c.purple },
	["@label"] = { fg = c.purple },
	["@method"] = { fg = c.blue },
	["@method.call"] = { fg = c.blue },
	["@namespace"] = { fg = c.yellow },
	["@none"] = {},
	["@number"] = { fg = c.orange },
	["@operator"] = { fg = c.cyan },
	["@parameter"] = { fg = c.white },
	["@parameter.reference"] = { fg = c.white },
	["@property"] = { fg = c.teal },
	["@punctuation.bracket"] = { fg = c.white },
	["@punctuation.delimiter"] = { fg = c.white },
	["@punctuation.special"] = { fg = c.cyan },
	["@repeat"] = { fg = c.purple },
	["@storageclass"] = { fg = c.yellow },
	["@string"] = { fg = c.green },
	["@string.escape"] = { fg = c.cyan },
	["@string.regex"] = { fg = c.teal },
	["@string.special"] = { fg = c.teal },
	["@symbol"] = { fg = c.orange },
	["@tag"] = { fg = c.blue },
	["@tag.attribute"] = { fg = c.teal },
	["@tag.delimiter"] = { fg = c.grey_fg },
	["@text"] = { fg = c.white },
	["@text.strong"] = { fg = c.white, bold = true },
	["@text.emphasis"] = { fg = c.white, italic = true },
	["@text.underline"] = { underline = true },
	["@text.strike"] = { strikethrough = true },
	["@text.title"] = { fg = c.blue, bold = true },
	["@text.literal"] = { fg = c.green },
	["@text.uri"] = { fg = c.teal, underline = true },
	["@text.math"] = { fg = c.orange },
	["@text.reference"] = { fg = c.blue },
	["@text.environment"] = { fg = c.yellow },
	["@text.environment.name"] = { fg = c.yellow },
	["@text.note"] = { fg = c.blue },
	["@text.warning"] = { fg = c.yellow },
	["@text.danger"] = { fg = c.red },
	["@todo"] = { fg = c.black, bg = c.yellow, bold = true },
	["@type"] = { fg = c.yellow },
	["@type.builtin"] = { fg = c.yellow },
	["@type.definition"] = { fg = c.yellow },
	["@variable"] = { fg = c.lavender },
	["@variable.builtin"] = { fg = c.vibrant_green },
	["@variable.member"] = { fg = c.teal },
	["@variable.parameter"] = { fg = c.white },

	-- lsp semantic tokens
	["@lsp.type.variable"] = { fg = c.lavender },
	["@lsp.type.property"] = { fg = c.teal },
	["@lsp.type.function"] = { fg = c.blue },
	["@lsp.type.method"] = { fg = c.blue },
	["@lsp.type.parameter"] = { fg = c.white },
	["@lsp.type.keyword"] = { fg = c.purple },
	["@lsp.type.namespace"] = { fg = c.yellow },
	["@lsp.type.type"] = { fg = c.yellow },
	["@lsp.type.class"] = { fg = c.yellow },
	["@lsp.type.enum"] = { fg = c.yellow },
	["@lsp.type.enumMember"] = { fg = c.orange },
	["@lsp.type.interface"] = { fg = c.yellow },
	["@lsp.type.macro"] = { fg = c.red },
	["@lsp.mod.readonly"] = { italic = true },
	["@lsp.mod.deprecated"] = { strikethrough = true },

	-- oil
	OilDir = { fg = c.folder_bg, bold = true },
	OilDirIcon = { fg = c.folder_bg },
	OilFile = { fg = c.white },
	OilLink = { fg = c.teal, underline = true },
	OilCopy = { fg = c.green },
	OilMove = { fg = c.yellow },
	OilChange = { fg = c.orange },
	OilCreate = { fg = c.green },
	OilDelete = { fg = c.red },
	OilHidden = { fg = c.grey_fg },

	-- snippet placeholders
	SnippetTabstop = { bg = "NONE" },
	SnippetTabstopActive = { bg = "NONE" },

	-- statusline custom groups
	St_NormalMode = { fg = c.blue, bg = c.statusline_bg, bold = true },
	St_InsertMode = { fg = c.green, bg = c.statusline_bg, bold = true },
	St_VisualMode = { fg = c.purple, bg = c.statusline_bg, bold = true },
	St_ReplaceMode = { fg = c.red, bg = c.statusline_bg, bold = true },
	St_CommandMode = { fg = c.orange, bg = c.statusline_bg, bold = true },
	St_TerminalMode = { fg = c.teal, bg = c.statusline_bg, bold = true },

	St_File = { fg = c.white, bg = c.statusline_bg },
	St_Git = { fg = c.lavender, bg = c.statusline_bg },
	St_DiagError = { fg = c.red, bg = c.statusline_bg },
	St_DiagWarn = { fg = c.yellow, bg = c.statusline_bg },
	St_DiagInfo = { fg = c.blue, bg = c.statusline_bg },
	St_DiagHint = { fg = c.teal, bg = c.statusline_bg },
	St_Lsp = { fg = c.teal, bg = c.statusline_bg, bold = true },
	St_Pos = { fg = c.white, bg = c.statusline_bg },

	-- mini.indentscope
	MiniIndentscopeSymbol = { fg = c.one_bg3 },

	-- substitute-like overlays
	Substitute = { fg = c.black, bg = c.yellow },
}

for group, opts in pairs(groups) do
	hi(group, opts)
end

-- Telescope
local telescope = {
	TelescopeNormal = { fg = c.white, bg = c.black },
	TelescopeBorder = { fg = c.line, bg = c.black },

	TelescopePreviewNormal = { fg = c.white, bg = c.black },
	TelescopePreviewBorder = { fg = c.line, bg = c.black },
	TelescopePreviewTitle = { fg = c.black, bg = c.green, bold = true },

	TelescopeResultsNormal = { fg = c.white, bg = c.black },
	TelescopeResultsBorder = { fg = c.line, bg = c.black },
	TelescopeResultsTitle = { fg = c.black, bg = c.purple, bold = true },

	TelescopePromptNormal = { fg = c.white, bg = c.darker_black },
	TelescopePromptBorder = { fg = c.line, bg = c.darker_black },
	TelescopePromptTitle = { fg = c.black, bg = c.blue, bold = true },

	TelescopeSelection = { bg = c.one_bg2, bold = true },
	TelescopeSelectionCaret = { fg = c.blue },
	TelescopeMatching = { fg = c.yellow, bold = true },
}

for group, opts in pairs(telescope) do
	hi(group, opts)
end

-- blink.cmp
local cmp = {
	BlinkCmpMenu = { fg = c.white, bg = c.black },
	BlinkCmpMenuBorder = { fg = c.line, bg = c.black },

	BlinkCmpLabel = { fg = c.white },
	BlinkCmpLabelMatch = { fg = c.yellow, bold = true },
	BlinkCmpLabelDetail = { fg = c.grey_fg },
	BlinkCmpLabelDescription = { fg = c.light_grey },
	BlinkCmpKind = { fg = c.purple },

	BlinkCmpDoc = { fg = c.white, bg = c.black },
	BlinkCmpDocBorder = { fg = c.line, bg = c.black },

	BlinkCmpSignatureHelp = { fg = c.white, bg = c.black },
	BlinkCmpSignatureHelpBorder = { fg = c.line, bg = c.black },
}

for group, opts in pairs(cmp) do
	hi(group, opts)
end

-- terminal colors
vim.g.terminal_color_0 = b.base00
vim.g.terminal_color_1 = b.base08
vim.g.terminal_color_2 = b.base0B
vim.g.terminal_color_3 = b.base0A
vim.g.terminal_color_4 = b.base0D
vim.g.terminal_color_5 = b.base0E
vim.g.terminal_color_6 = b.base0C
vim.g.terminal_color_7 = b.base05
vim.g.terminal_color_8 = b.base03
vim.g.terminal_color_9 = b.base08
vim.g.terminal_color_10 = b.base0B
vim.g.terminal_color_11 = b.base0A
vim.g.terminal_color_12 = b.base0D
vim.g.terminal_color_13 = b.base0E
vim.g.terminal_color_14 = b.base0C
vim.g.terminal_color_15 = b.base07
