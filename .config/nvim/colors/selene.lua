if vim.g.colors_name then
	vim.cmd("hi clear")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "selene"

local M = {}

M.base_30 = {
	-- Selene: OLED-black with neutral silver UI, not blue-white chrome.
	-- Hue is reserved for syntax meaning; editor structure stays black/gray/silver.
	white = "#AFAFAF",
	black = "#000000",
	darker_black = "#000000",
	black2 = "#050505",
	one_bg = "#080808",
	one_bg2 = "#101010",
	one_bg3 = "#202020",
	grey = "#2A2A2A",
	grey_fg = "#4A4A4A",
	grey_fg2 = "#666666",
	light_grey = "#808080",

	red = "#B56A72",
	baby_pink = "#C7838A",
	pink = "#C7838A",

	line = "#101010",

	green = "#8BAA8F",
	vibrant_green = "#A7C2AA",

	-- Blue is deliberately steel-gray, not icy/cyan.
	nord_blue = "#9AA3AD",
	blue = "#8490A0",

	-- Amber/brass warnings. Shifted away from olive-green yellow.
	yellow = "#B38E5F",
	sun = "#C7A66E",

	purple = "#9B94B3",
	dark_purple = "#87809C",

	teal = "#7FA3A0",
	copper = "#A27961", -- reserved warm swatch; not used by UI chrome
	accent = "#909090",

	cyan = "#8AA6A5",

	cursor = "#B8B8B8",
	selection_fg = "#C8C8C8",
	mark = "#909090",
	accent_hi = "#B8B8B8",
	accent_dim = "#5A5A5A",
	silver = "#B8B8B8",
	dim_silver = "#7F7F7F",

	statusline_bg = "#000000",
	lightbg = "#070707",
	pmenu_bg = "#909090",
	folder_bg = "#9AA3AD",
	lavender = "#A9A2BC",
}

M.base_16 = {
	base00 = "#000000",
	base01 = "#050505",
	base02 = "#080808",
	base03 = "#181818",
	base04 = "#666666",
	base05 = "#AFAFAF",
	base06 = "#B8B8B8",
	base07 = "#C8C8C8",
	base08 = "#B56A72",
	base09 = "#8AA6A5",
	base0A = "#B38E5F",
	base0B = "#8BAA8F",
	base0C = "#7FA3A0",
	base0D = "#8490A0",
	base0E = "#9B94B3",
	base0F = "#8AA6A5",
}

M.ansi = {
	"#000000",
	"#B56A72",
	"#8BAA8F",
	"#B38E5F",
	"#8490A0",
	"#9B94B3",
	"#7FA3A0",
	"#AFAFAF",
	"#181818",
	"#C7838A",
	"#A7C2AA",
	"#C7A66E",
	"#9AA3AD",
	"#A9A2BC",
	"#96B8B6",
	"#C8C8C8",
}

local c = M.base_30
local b = M.base_16

-- Design rule: UI chrome is black/gray/silver first. Blue is muted steel,
-- and warm hues are reserved for semantic warnings/errors or terminal ANSI compatibility.

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local groups = {
	-- base editor
	Normal = { fg = c.white, bg = c.black },
	NormalNC = { fg = c.white, bg = c.black },
	NormalFloat = { fg = c.white, bg = c.darker_black },
	FloatBorder = { fg = c.grey, bg = c.darker_black },
	FloatTitle = { fg = c.accent_hi, bg = c.black, bold = true },

	Cursor = { fg = c.black, bg = c.cursor },
	lCursor = { fg = c.black, bg = c.cursor },
	CursorIM = { fg = c.black, bg = c.cursor },

	CursorLine = { bg = c.lightbg },
	CursorLineNr = { fg = c.silver, bold = true },
	CursorColumn = { bg = c.one_bg },
	ColorColumn = { bg = c.one_bg },

	LineNr = { fg = c.grey_fg },
	SignColumn = { fg = c.grey_fg, bg = c.black },
	FoldColumn = { fg = c.grey_fg, bg = c.black },
	Folded = { fg = c.grey_fg, bg = c.lightbg },

	Visual = { bg = c.one_bg3 },
	VisualNOS = { bg = c.one_bg3 },

	Search = { fg = c.black, bg = c.mark },
	IncSearch = { fg = c.black, bg = c.accent_hi },
	CurSearch = { fg = c.black, bg = c.accent_hi },

	MatchParen = { fg = c.silver, bg = c.one_bg2, bold = true },

	Pmenu = { fg = c.white, bg = c.darker_black },
	PmenuSel = { fg = c.black, bg = c.pmenu_bg, bold = true },
	PmenuSbar = { bg = c.one_bg },
	PmenuThumb = { bg = c.grey },

	StatusLine = { fg = c.white, bg = c.statusline_bg },
	StatusLineNC = { fg = c.grey_fg, bg = c.statusline_bg },

	TabLine = { fg = c.grey_fg, bg = c.one_bg },
	TabLineFill = { fg = c.grey_fg, bg = c.black },
	TabLineSel = { fg = c.silver, bg = c.one_bg3, bold = true },

	WinSeparator = { fg = c.line },
	VertSplit = { fg = c.line },

	Directory = { fg = c.nord_blue, bold = true },
	Title = { fg = c.silver, bold = true },

	ErrorMsg = { fg = c.red, bold = true },
	WarningMsg = { fg = c.yellow, bold = true },
	MoreMsg = { fg = c.silver, bold = true },
	Question = { fg = c.silver, bold = true },

	NonText = { fg = c.grey },
	SpecialKey = { fg = c.grey },
	Whitespace = { fg = c.grey },
	EndOfBuffer = { fg = c.black },

	Conceal = { fg = c.grey_fg },
	Ignore = { fg = c.grey_fg },

	QuickFixLine = { bg = c.one_bg2, bold = true },

	-- syntax
	Comment = { fg = c.dim_silver, italic = true },

	Constant = { fg = c.cyan },
	String = { fg = c.green },
	Character = { fg = c.green },
	Number = { fg = c.cyan },
	Boolean = { fg = c.silver, bold = true },
	Float = { fg = c.cyan },

	Identifier = { fg = c.white },
	Function = { fg = c.blue },

	Statement = { fg = c.purple },
	Conditional = { fg = c.purple },
	Repeat = { fg = c.purple },
	Label = { fg = c.purple },
	Operator = { fg = c.grey_fg2 },
	Keyword = { fg = c.purple },
	Exception = { fg = c.red },

	PreProc = { fg = c.red },
	Include = { fg = c.purple },
	Define = { fg = c.purple },
	Macro = { fg = c.red },
	PreCondit = { fg = c.red },

	Type = { fg = c.nord_blue },
	StorageClass = { fg = c.nord_blue },
	Structure = { fg = c.nord_blue },
	Typedef = { fg = c.nord_blue },

	Special = { fg = c.teal },
	SpecialChar = { fg = c.teal },
	Tag = { fg = c.blue },
	Delimiter = { fg = c.grey_fg2 },
	SpecialComment = { fg = c.light_grey },
	Debug = { fg = c.red },

	Underlined = { underline = true },
	Bold = { bold = true },
	Italic = { italic = true },

	Error = { fg = c.red, bold = true },
	Todo = { fg = c.silver, bg = "NONE", italic = true, bold = true },

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
	SignifySignChange = { fg = c.blue },
	SignifySignDelete = { fg = c.red },

	-- diff / git
	DiffAdd = { fg = c.green, bg = c.lightbg },
	DiffChange = { fg = c.nord_blue, bg = c.lightbg },
	DiffDelete = { fg = c.red, bg = c.lightbg },
	DiffText = { fg = c.silver, bg = c.one_bg2 },

	GitSignsAdd = { fg = c.green, bg = c.black },
	GitSignsChange = { fg = c.nord_blue, bg = c.black },
	GitSignsDelete = { fg = c.red, bg = c.black },

	gitcommitSummary = { fg = c.white },
	gitcommitComment = { fg = c.light_grey },
	gitcommitUntracked = { fg = c.light_grey },
	gitcommitDiscarded = { fg = c.light_grey },
	gitcommitSelected = { fg = c.light_grey },
	gitcommitUnmerged = { fg = c.red },
	gitcommitOnBranch = { fg = c.grey_fg },
	gitcommitArrow = { fg = c.grey_fg },
	gitcommitFile = { fg = c.nord_blue },

	-- spell
	SpellBad = { sp = c.red, undercurl = true },
	SpellCap = { sp = c.nord_blue, undercurl = true },
	SpellRare = { sp = c.purple, undercurl = true },
	SpellLocal = { sp = c.teal, undercurl = true },

	-- markdown
	markdownHeadingDelimiter = { fg = c.silver, bold = true },
	markdownCode = { fg = c.green, bg = c.black },
	markdownCodeBlock = { fg = c.green, bg = c.black },
	markdownH1 = { fg = c.silver, bold = true },
	markdownH2 = { fg = c.nord_blue, bold = true },
	markdownLinkText = { fg = c.nord_blue, underline = true },
	markdownUrl = { fg = c.cyan, underline = true },

	-- treesitter / captures
	["@annotation"] = { fg = c.teal },
	["@attribute"] = { fg = c.teal },
	["@boolean"] = { fg = c.silver, bold = true },
	["@character"] = { fg = c.green },
	["@character.special"] = { fg = c.teal },
	["@comment"] = { fg = c.dim_silver, italic = true },
	["@conditional"] = { fg = c.purple },
	["@constant"] = { fg = c.cyan },
	["@constant.builtin"] = { fg = c.silver },
	["@constant.macro"] = { fg = c.red },
	["@constructor"] = { fg = c.nord_blue },
	["@debug"] = { fg = c.red },
	["@define"] = { fg = c.purple },
	["@exception"] = { fg = c.red },
	["@field"] = { fg = c.cyan },
	["@float"] = { fg = c.cyan },
	["@function"] = { fg = c.blue },
	["@function.builtin"] = { fg = c.blue },
	["@function.call"] = { fg = c.blue },
	["@function.macro"] = { fg = c.red },
	["@include"] = { fg = c.purple },
	["@keyword"] = { fg = c.purple },
	["@keyword.function"] = { fg = c.purple },
	["@keyword.operator"] = { fg = c.grey_fg2 },
	["@keyword.return"] = { fg = c.purple },
	["@label"] = { fg = c.purple },
	["@method"] = { fg = c.blue },
	["@method.call"] = { fg = c.blue },
	["@namespace"] = { fg = c.nord_blue },
	["@none"] = {},
	["@number"] = { fg = c.cyan },
	["@operator"] = { fg = c.grey_fg2 },
	["@parameter"] = { fg = c.white },
	["@parameter.reference"] = { fg = c.white },
	["@property"] = { fg = c.cyan },
	["@punctuation.bracket"] = { fg = c.grey_fg2 },
	["@punctuation.delimiter"] = { fg = c.grey_fg2 },
	["@punctuation.special"] = { fg = c.dim_silver },
	["@repeat"] = { fg = c.purple },
	["@storageclass"] = { fg = c.nord_blue },
	["@string"] = { fg = c.green },
	["@string.escape"] = { fg = c.cyan },
	["@string.regex"] = { fg = c.teal },
	["@string.special"] = { fg = c.teal },
	["@symbol"] = { fg = c.cyan },
	["@tag"] = { fg = c.blue },
	["@tag.attribute"] = { fg = c.teal },
	["@tag.delimiter"] = { fg = c.grey_fg },
	["@text"] = { fg = c.white },
	["@text.strong"] = { fg = c.white, bold = true },
	["@text.emphasis"] = { fg = c.white, italic = true },
	["@text.underline"] = { underline = true },
	["@text.strike"] = { strikethrough = true },
	["@text.title"] = { fg = c.silver, bold = true },
	["@text.literal"] = { fg = c.green },
	["@text.uri"] = { fg = c.teal, underline = true },
	["@text.math"] = { fg = c.cyan },
	["@text.reference"] = { fg = c.nord_blue },
	["@text.environment"] = { fg = c.nord_blue },
	["@text.environment.name"] = { fg = c.nord_blue },
	["@text.note"] = { fg = c.nord_blue },
	["@text.warning"] = { fg = c.yellow },
	["@text.danger"] = { fg = c.red },
	["@todo"] = { fg = c.silver, bg = "NONE", italic = true },
	["@comment.todo"] = { fg = c.silver, bg = "NONE", italic = true },
	["@comment.note"] = { fg = c.silver, bg = "NONE", italic = true },
	["@comment.warning"] = { fg = c.silver, bg = "NONE", italic = true },
	["@comment.error"] = { fg = c.silver, bg = "NONE", italic = true },
	["@type"] = { fg = c.nord_blue },
	["@type.builtin"] = { fg = c.nord_blue },
	["@type.definition"] = { fg = c.nord_blue },
	["@variable"] = { fg = c.white },
	["@variable.builtin"] = { fg = c.silver },
	["@variable.member"] = { fg = c.cyan },
	["@variable.parameter"] = { fg = c.white },

	-- lsp semantic tokens
	["@lsp.type.variable"] = { fg = c.white },
	["@lsp.type.property"] = { fg = c.cyan },
	["@lsp.type.function"] = { fg = c.blue },
	["@lsp.type.method"] = { fg = c.blue },
	["@lsp.type.parameter"] = { fg = c.white },
	["@lsp.type.keyword"] = { fg = c.purple },
	["@lsp.type.namespace"] = { fg = c.nord_blue },
	["@lsp.type.type"] = { fg = c.nord_blue },
	["@lsp.type.class"] = { fg = c.nord_blue },
	["@lsp.type.enum"] = { fg = c.nord_blue },
	["@lsp.type.enumMember"] = { fg = c.silver },
	["@lsp.type.interface"] = { fg = c.nord_blue },
	["@lsp.type.macro"] = { fg = c.red },
	["@lsp.mod.readonly"] = { italic = true },
	["@lsp.mod.deprecated"] = { strikethrough = true },

	-- oil
	OilDir = { fg = c.nord_blue, bold = true },
	OilDirIcon = { fg = c.nord_blue },
	OilFile = { fg = c.white },
	OilLink = { fg = c.cyan, underline = true },
	OilCopy = { fg = c.green },
	OilMove = { fg = c.nord_blue },
	OilChange = { fg = c.silver },
	OilCreate = { fg = c.green },
	OilDelete = { fg = c.red },
	OilHidden = { fg = c.grey_fg },

	-- snippet placeholders
	SnippetTabstop = { bg = "NONE" },
	SnippetTabstopActive = { bg = "NONE" },

	-- statusline custom groups
	St_NormalMode = { fg = c.silver, bg = c.statusline_bg, bold = true },
	St_InsertMode = { fg = c.teal, bg = c.statusline_bg, bold = true },
	St_VisualMode = { fg = c.silver, bg = c.statusline_bg, bold = true },
	St_ReplaceMode = { fg = c.red, bg = c.statusline_bg, bold = true },
	St_CommandMode = { fg = c.nord_blue, bg = c.statusline_bg, bold = true },
	St_TerminalMode = { fg = c.teal, bg = c.statusline_bg, bold = true },

	St_File = { fg = c.white, bg = c.statusline_bg },
	St_Git = { fg = c.dim_silver, bg = c.statusline_bg },
	St_DiagError = { fg = c.red, bg = c.statusline_bg },
	St_DiagWarn = { fg = c.yellow, bg = c.statusline_bg },
	St_DiagInfo = { fg = c.nord_blue, bg = c.statusline_bg },
	St_DiagHint = { fg = c.teal, bg = c.statusline_bg },
	St_Lsp = { fg = c.silver, bg = c.statusline_bg, bold = true },
	St_Pos = { fg = c.white, bg = c.statusline_bg },

	-- mini.indentscope
	MiniIndentscopeSymbol = { fg = c.one_bg3 },

	-- substitute-like overlays
	Substitute = { fg = c.black, bg = c.silver },
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
	TelescopePreviewTitle = { fg = c.black, bg = c.silver, bold = true },

	TelescopeResultsNormal = { fg = c.white, bg = c.black },
	TelescopeResultsBorder = { fg = c.line, bg = c.black },
	TelescopeResultsTitle = { fg = c.black, bg = c.dim_silver, bold = true },

	TelescopePromptNormal = { fg = c.white, bg = c.darker_black },
	TelescopePromptBorder = { fg = c.line, bg = c.darker_black },
	TelescopePromptTitle = { fg = c.black, bg = c.silver, bold = true },

	TelescopeSelection = { bg = c.one_bg3, bold = true },
	TelescopeSelectionCaret = { fg = c.silver },
	TelescopeMatching = { fg = c.silver, bold = true },
}

for group, opts in pairs(telescope) do
	hi(group, opts)
end

-- blink.cmp
local cmp = {
	BlinkCmpMenu = { fg = c.white, bg = c.darker_black },
	BlinkCmpMenuBorder = { fg = c.line, bg = c.black },

	BlinkCmpLabel = { fg = c.white },
	BlinkCmpLabelMatch = { fg = c.silver, bold = true },
	BlinkCmpLabelDetail = { fg = c.grey_fg },
	BlinkCmpLabelDescription = { fg = c.light_grey },
	BlinkCmpKind = { fg = c.dim_silver },

	BlinkCmpDoc = { fg = c.white, bg = c.darker_black },
	BlinkCmpDocBorder = { fg = c.line, bg = c.black },

	BlinkCmpSignatureHelp = { fg = c.white, bg = c.black },
	BlinkCmpSignatureHelpBorder = { fg = c.line, bg = c.black },
}

for group, opts in pairs(cmp) do
	hi(group, opts)
end

-- terminal colors
for i, color in ipairs(M.ansi) do
	vim.g["terminal_color_" .. (i - 1)] = color
end
