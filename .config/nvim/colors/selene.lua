if vim.g.colors_name then
	vim.cmd("hi clear")
end

if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "selene"

local M = {}

M.base_30 = {
	black = "#000000",
	darker_black = "#000000",
	black2 = "#050505",
	one_bg = "#080808",
	one_bg2 = "#121212",
	one_bg3 = "#202020",
	line = "#262626",
	lightbg = "#080808",
	statusline_bg = "#000000",

	grey = "#303030",
	grey_fg = "#606060",
	grey_fg2 = "#777777",
	light_grey = "#8A8A8A",
	dim_silver = "#777777",
	silver = "#A6A6A6",
	white = "#AFAFAF",
	bright_white = "#C8C8C8",

	red = "#B96572",
	baby_pink = "#CC7D87",
	pink = "#CC7D87",

	green = "#7FA68D",
	vibrant_green = "#94BCA1",

	yellow = "#B38E5F",
	sun = "#C7A66E",

	blue = "#8490A0",
	nord_blue = "#9AA3AD",
	folder_bg = "#9AA3AD",

	purple = "#8D86AA",
	dark_purple = "#787190",
	lavender = "#A49AC2",

	teal = "#72A6A0",
	cyan = "#86BCB5",

	orange = "#9A735E",
	accent = "#A6A6A6",
	accent_hi = "#C8C8C8",
	cursor = "#B8B8B8",
	selection_fg = "#C8C8C8",
	selection_bg = "#202020",
	mark = "#909090",
	pmenu_bg = "#303030",
}

M.base_16 = {
	base00 = "#000000",
	base01 = "#050505",
	base02 = "#080808",
	base03 = "#1A1A1A",
	base04 = "#777777",
	base05 = "#AFAFAF",
	base06 = "#B8B8B8",
	base07 = "#C8C8C8",
	base08 = "#B96572",
	base09 = "#9A735E",
	base0A = "#B38E5F",
	base0B = "#7FA68D",
	base0C = "#72A6A0",
	base0D = "#8490A0",
	base0E = "#8D86AA",
	base0F = "#86BCB5",
}

M.ansi = {
	"#000000",
	"#B96572",
	"#7FA68D",
	"#B38E5F",
	"#8490A0",
	"#8D86AA",
	"#72A6A0",
	"#AFAFAF",
	"#1A1A1A",
	"#CC7D87",
	"#94BCA1",
	"#C7A66E",
	"#9AA3AD",
	"#A49AC2",
	"#86BCB5",
	"#C8C8C8",
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
	NormalFloat = { fg = c.white, bg = c.one_bg },
	FloatBorder = { fg = c.grey, bg = c.one_bg },
	FloatTitle = { fg = c.silver, bg = c.one_bg },
	FloatFooter = { fg = c.grey_fg2, bg = c.one_bg },

	Cursor = { fg = c.black, bg = c.cursor },
	lCursor = { fg = c.black, bg = c.cursor },
	CursorIM = { fg = c.black, bg = c.cursor },
	CursorLine = { bg = c.black2 },
	CursorColumn = { bg = c.one_bg },
	CursorLineNr = { fg = c.silver },
	CursorLineFold = { fg = c.grey_fg2, bg = c.black2 },
	CursorLineSign = { fg = c.grey_fg2, bg = c.black2 },
	ColorColumn = { bg = c.one_bg },

	LineNr = { fg = c.grey_fg },
	LineNrAbove = { fg = c.grey_fg },
	LineNrBelow = { fg = c.grey_fg },
	SignColumn = { fg = c.grey_fg, bg = c.black },
	FoldColumn = { fg = c.grey_fg, bg = c.black },
	Folded = { fg = c.grey_fg2, bg = c.one_bg },

	Visual = { fg = c.selection_fg, bg = c.selection_bg },
	VisualNOS = { fg = c.selection_fg, bg = c.selection_bg },

	Search = { fg = c.bright_white, bg = c.one_bg3 },
	IncSearch = { fg = c.black, bg = c.accent },
	CurSearch = { fg = c.black, bg = c.accent },
	Substitute = { fg = c.black, bg = c.accent },
	MatchParen = { fg = c.bright_white, bg = c.one_bg3 },

	Pmenu = { fg = c.white, bg = c.one_bg },
	PmenuSel = { fg = c.bright_white, bg = c.pmenu_bg },
	PmenuSbar = { bg = c.one_bg2 },
	PmenuThumb = { bg = c.grey },
	PmenuKind = { fg = c.blue, bg = c.one_bg },
	PmenuKindSel = { fg = c.bright_white, bg = c.pmenu_bg },
	PmenuExtra = { fg = c.grey_fg2, bg = c.one_bg },
	PmenuExtraSel = { fg = c.grey_fg2, bg = c.pmenu_bg },
	PmenuMatch = { fg = c.bright_white, bg = c.one_bg },
	PmenuMatchSel = { fg = c.bright_white, bg = c.pmenu_bg },

	StatusLine = { fg = c.white, bg = c.statusline_bg },
	StatusLineNC = { fg = c.grey_fg, bg = c.statusline_bg },
	WinBar = { fg = c.grey_fg2, bg = c.black },
	WinBarNC = { fg = c.grey_fg, bg = c.black },

	TabLine = { fg = c.grey_fg2, bg = c.one_bg },
	TabLineFill = { fg = c.grey_fg, bg = c.black },
	TabLineSel = { fg = c.white, bg = c.one_bg2 },
	WinSeparator = { fg = c.line },
	VertSplit = { fg = c.line },

	Directory = { fg = c.nord_blue },
	Title = { fg = c.silver },

	ErrorMsg = { fg = c.red },
	WarningMsg = { fg = c.yellow },
	ModeMsg = { fg = c.dim_silver, bg = c.black },
	MsgArea = { fg = c.white, bg = c.black },
	MsgSeparator = { fg = c.line, bg = c.black },
	MoreMsg = { fg = c.dim_silver },
	Question = { fg = c.silver },
	QuickFixLine = { fg = c.bright_white, bg = c.one_bg2 },
	WildMenu = { fg = c.bright_white, bg = c.one_bg3 },

	NonText = { fg = c.grey },
	SpecialKey = { fg = c.grey },
	Whitespace = { fg = c.grey },
	EndOfBuffer = { fg = c.black },
	Conceal = { fg = c.grey_fg2 },
	Ignore = { fg = c.grey_fg },

	-- syntax
	Comment = { fg = c.grey_fg2, italic = true },

	Constant = { fg = c.yellow },
	String = { fg = c.green },
	Character = { fg = c.green },
	Number = { fg = c.yellow },
	Boolean = { fg = c.yellow },
	Float = { fg = c.yellow },

	Identifier = { fg = c.white },
	Function = { fg = c.blue },

	Statement = { fg = c.purple },
	Conditional = { fg = c.purple },
	Repeat = { fg = c.purple },
	Label = { fg = c.purple },
	Operator = { fg = c.grey_fg2 },
	Keyword = { fg = c.purple },
	Exception = { fg = c.red },

	PreProc = { fg = c.purple },
	Include = { fg = c.purple },
	Define = { fg = c.purple },
	Macro = { fg = c.red },
	PreCondit = { fg = c.purple },

	Type = { fg = c.nord_blue },
	StorageClass = { fg = c.nord_blue },
	Structure = { fg = c.nord_blue },
	Typedef = { fg = c.nord_blue },

	Special = { fg = c.teal },
	SpecialChar = { fg = c.teal },
	Tag = { fg = c.blue },
	Delimiter = { fg = c.grey_fg2 },
	SpecialComment = { fg = c.grey_fg2, italic = true },
	Debug = { fg = c.red },

	Underlined = { fg = c.blue, underline = true },
	Bold = { bold = true },
	Italic = { italic = true },
	Error = { fg = c.red },
	Todo = { fg = c.light_grey, bg = "NONE", italic = true },

	-- diagnostics
	DiagnosticError = { fg = c.red },
	DiagnosticWarn = { fg = c.yellow },
	DiagnosticInfo = { fg = c.blue },
	DiagnosticHint = { fg = c.teal },
	DiagnosticOk = { fg = c.green },
	DiagnosticUnnecessary = { fg = c.grey_fg },
	DiagnosticDeprecated = { fg = c.grey_fg2, strikethrough = true },
	DiagnosticVirtualTextError = { fg = c.red, bg = c.black2 },
	DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.black2 },
	DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.black2 },
	DiagnosticVirtualTextHint = { fg = c.teal, bg = c.black2 },
	DiagnosticVirtualTextOk = { fg = c.green, bg = c.black2 },
	DiagnosticUnderlineError = { sp = c.red, undercurl = true },
	DiagnosticUnderlineWarn = { sp = c.yellow, undercurl = true },
	DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
	DiagnosticUnderlineHint = { sp = c.teal, undercurl = true },
	DiagnosticUnderlineOk = { sp = c.green, undercurl = true },
	DiagnosticFloatingError = { fg = c.red },
	DiagnosticFloatingWarn = { fg = c.yellow },
	DiagnosticFloatingInfo = { fg = c.blue },
	DiagnosticFloatingHint = { fg = c.teal },
	DiagnosticFloatingOk = { fg = c.green },
	DiagnosticSignError = { fg = c.red, bg = c.black },
	DiagnosticSignWarn = { fg = c.yellow, bg = c.black },
	DiagnosticSignInfo = { fg = c.blue, bg = c.black },
	DiagnosticSignHint = { fg = c.teal, bg = c.black },
	DiagnosticSignOk = { fg = c.green, bg = c.black },

	-- LSP references
	LspReferenceText = { bg = c.one_bg2 },
	LspReferenceRead = { bg = c.one_bg2 },
	LspReferenceWrite = { bg = c.one_bg2 },
	LspCodeLens = { fg = c.grey_fg2 },
	LspCodeLensSeparator = { fg = c.grey },
	LspSignatureActiveParameter = { fg = c.bright_white, bg = c.one_bg3 },
	LspInlayHint = { fg = c.grey_fg2, bg = c.black2 },

	-- diff / git
	Added = { fg = c.green },
	Removed = { fg = c.red },
	Changed = { fg = c.blue },
	DiffAdd = { fg = c.green, bg = c.black2 },
	DiffChange = { fg = c.blue, bg = c.black2 },
	DiffDelete = { fg = c.red, bg = c.black2 },
	DiffText = { fg = c.bright_white, bg = c.one_bg2 },
	diffAdded = { fg = c.green },
	diffRemoved = { fg = c.red },
	diffChanged = { fg = c.blue },
	diffOldFile = { fg = c.red },
	diffNewFile = { fg = c.green },
	diffFile = { fg = c.blue },
	diffLine = { fg = c.grey_fg2 },
	diffIndexLine = { fg = c.grey_fg2 },

	SignifySignAdd = { fg = c.green, bg = c.black },
	SignifySignChange = { fg = c.blue, bg = c.black },
	SignifySignDelete = { fg = c.red, bg = c.black },
	GitSignsAdd = { fg = c.green, bg = c.black },
	GitSignsChange = { fg = c.blue, bg = c.black },
	GitSignsDelete = { fg = c.red, bg = c.black },
	GitSignsAddLn = { bg = c.black2 },
	GitSignsChangeLn = { bg = c.black2 },
	GitSignsDeleteLn = { bg = c.black2 },
	GitSignsCurrentLineBlame = { fg = c.grey_fg2 },

	gitcommitSummary = { fg = c.white },
	gitcommitComment = { fg = c.grey_fg2 },
	gitcommitUntracked = { fg = c.grey_fg2 },
	gitcommitDiscarded = { fg = c.grey_fg2 },
	gitcommitSelected = { fg = c.grey_fg2 },
	gitcommitUnmerged = { fg = c.red },
	gitcommitOnBranch = { fg = c.grey_fg2 },
	gitcommitArrow = { fg = c.grey_fg2 },
	gitcommitFile = { fg = c.blue },

	-- spell
	SpellBad = { sp = c.red, undercurl = true },
	SpellCap = { sp = c.blue, undercurl = true },
	SpellRare = { sp = c.purple, undercurl = true },
	SpellLocal = { sp = c.teal, undercurl = true },

	-- markdown / legacy syntax
	markdownHeadingDelimiter = { fg = c.silver },
	markdownCode = { fg = c.green, bg = c.black },
	markdownCodeBlock = { fg = c.green, bg = c.black },
	markdownH1 = { fg = c.bright_white },
	markdownH2 = { fg = c.silver },
	markdownH3 = { fg = c.silver },
	markdownLinkText = { fg = c.blue, underline = true },
	markdownUrl = { fg = c.teal, underline = true },
	markdownBold = { fg = c.white, bold = true },
	markdownItalic = { fg = c.white, italic = true },

	-- Treesitter captures: current names
	["@annotation"] = { fg = c.teal },
	["@attribute"] = { fg = c.teal },
	["@boolean"] = { fg = c.yellow },
	["@character"] = { fg = c.green },
	["@character.special"] = { fg = c.teal },
	["@comment"] = { fg = c.grey_fg2, italic = true },
	["@comment.documentation"] = { fg = c.grey_fg2, italic = true },
	["@comment.error"] = { fg = c.red, italic = true },
	["@comment.warning"] = { fg = c.yellow, italic = true },
	["@comment.todo"] = { fg = c.light_grey, italic = true },
	["@comment.note"] = { fg = c.blue, italic = true },
	["@constant"] = { fg = c.yellow },
	["@constant.builtin"] = { fg = c.yellow },
	["@constant.macro"] = { fg = c.red },
	["@constructor"] = { fg = c.nord_blue },
	["@diff.plus"] = { fg = c.green },
	["@diff.minus"] = { fg = c.red },
	["@diff.delta"] = { fg = c.blue },
	["@function"] = { fg = c.blue },
	["@function.builtin"] = { fg = c.blue },
	["@function.call"] = { fg = c.blue },
	["@function.macro"] = { fg = c.red },
	["@function.method"] = { fg = c.blue },
	["@function.method.call"] = { fg = c.blue },
	["@keyword"] = { fg = c.purple },
	["@keyword.conditional"] = { fg = c.purple },
	["@keyword.coroutine"] = { fg = c.purple },
	["@keyword.debug"] = { fg = c.red },
	["@keyword.directive"] = { fg = c.purple },
	["@keyword.directive.define"] = { fg = c.purple },
	["@keyword.exception"] = { fg = c.red },
	["@keyword.function"] = { fg = c.purple },
	["@keyword.import"] = { fg = c.purple },
	["@keyword.modifier"] = { fg = c.purple },
	["@keyword.operator"] = { fg = c.grey_fg2 },
	["@keyword.repeat"] = { fg = c.purple },
	["@keyword.return"] = { fg = c.purple },
	["@label"] = { fg = c.purple },
	["@module"] = { fg = c.nord_blue },
	["@module.builtin"] = { fg = c.nord_blue },
	["@number"] = { fg = c.yellow },
	["@number.float"] = { fg = c.yellow },
	["@operator"] = { fg = c.grey_fg2 },
	["@property"] = { fg = c.teal },
	["@punctuation.bracket"] = { fg = c.grey_fg2 },
	["@punctuation.delimiter"] = { fg = c.grey_fg2 },
	["@punctuation.special"] = { fg = c.grey_fg2 },
	["@string"] = { fg = c.green },
	["@string.documentation"] = { fg = c.green },
	["@string.escape"] = { fg = c.cyan },
	["@string.regexp"] = { fg = c.teal },
	["@string.special"] = { fg = c.teal },
	["@string.special.path"] = { fg = c.teal },
	["@string.special.symbol"] = { fg = c.teal },
	["@string.special.url"] = { fg = c.teal, underline = true },
	["@tag"] = { fg = c.blue },
	["@tag.attribute"] = { fg = c.teal },
	["@tag.delimiter"] = { fg = c.grey_fg2 },
	["@type"] = { fg = c.nord_blue },
	["@type.builtin"] = { fg = c.nord_blue },
	["@type.definition"] = { fg = c.nord_blue },
	["@type.qualifier"] = { fg = c.nord_blue },
	["@variable"] = { fg = c.white },
	["@variable.builtin"] = { fg = c.vibrant_green },
	["@variable.member"] = { fg = c.teal },
	["@variable.parameter"] = { fg = c.white },
	["@variable.parameter.builtin"] = { fg = c.white },

	-- Treesitter captures: legacy names
	["@conditional"] = { fg = c.purple },
	["@debug"] = { fg = c.red },
	["@define"] = { fg = c.purple },
	["@exception"] = { fg = c.red },
	["@field"] = { fg = c.teal },
	["@float"] = { fg = c.yellow },
	["@include"] = { fg = c.purple },
	["@method"] = { fg = c.blue },
	["@method.call"] = { fg = c.blue },
	["@namespace"] = { fg = c.nord_blue },
	["@parameter"] = { fg = c.white },
	["@parameter.reference"] = { fg = c.white },
	["@repeat"] = { fg = c.purple },
	["@storageclass"] = { fg = c.nord_blue },
	["@string.regex"] = { fg = c.teal },
	["@symbol"] = { fg = c.teal },
	["@todo"] = { fg = c.light_grey, bg = "NONE", italic = true },

	-- Treesitter markup captures
	["@markup"] = { fg = c.white },
	["@markup.strong"] = { fg = c.white, bold = true },
	["@markup.italic"] = { fg = c.white, italic = true },
	["@markup.strikethrough"] = { fg = c.grey_fg2, strikethrough = true },
	["@markup.underline"] = { underline = true },
	["@markup.heading"] = { fg = c.bright_white },
	["@markup.heading.1"] = { fg = c.bright_white },
	["@markup.heading.2"] = { fg = c.silver },
	["@markup.heading.3"] = { fg = c.silver },
	["@markup.link"] = { fg = c.blue },
	["@markup.link.label"] = { fg = c.blue },
	["@markup.link.url"] = { fg = c.teal, underline = true },
	["@markup.raw"] = { fg = c.green },
	["@markup.raw.block"] = { fg = c.green },
	["@markup.list"] = { fg = c.grey_fg2 },
	["@markup.quote"] = { fg = c.grey_fg2, italic = true },
	["@markup.math"] = { fg = c.yellow },
	["@markup.environment"] = { fg = c.nord_blue },
	["@markup.environment.name"] = { fg = c.nord_blue },

	-- nvim-treesitter old text captures
	["@text"] = { fg = c.white },
	["@text.strong"] = { fg = c.white, bold = true },
	["@text.emphasis"] = { fg = c.white, italic = true },
	["@text.underline"] = { underline = true },
	["@text.strike"] = { fg = c.grey_fg2, strikethrough = true },
	["@text.title"] = { fg = c.bright_white },
	["@text.literal"] = { fg = c.green },
	["@text.uri"] = { fg = c.teal, underline = true },
	["@text.math"] = { fg = c.yellow },
	["@text.reference"] = { fg = c.blue },
	["@text.environment"] = { fg = c.nord_blue },
	["@text.environment.name"] = { fg = c.nord_blue },
	["@text.note"] = { fg = c.blue },
	["@text.warning"] = { fg = c.yellow },
	["@text.danger"] = { fg = c.red },

	-- LSP semantic tokens
	["@lsp.type.variable"] = { fg = c.white },
	["@lsp.type.property"] = { fg = c.teal },
	["@lsp.type.function"] = { fg = c.blue },
	["@lsp.type.method"] = { fg = c.blue },
	["@lsp.type.parameter"] = { fg = c.white },
	["@lsp.type.keyword"] = { fg = c.purple },
	["@lsp.type.namespace"] = { fg = c.nord_blue },
	["@lsp.type.type"] = { fg = c.nord_blue },
	["@lsp.type.class"] = { fg = c.nord_blue },
	["@lsp.type.struct"] = { fg = c.nord_blue },
	["@lsp.type.enum"] = { fg = c.nord_blue },
	["@lsp.type.enumMember"] = { fg = c.yellow },
	["@lsp.type.interface"] = { fg = c.nord_blue },
	["@lsp.type.macro"] = { fg = c.red },
	["@lsp.type.decorator"] = { fg = c.teal },
	["@lsp.type.event"] = { fg = c.teal },
	["@lsp.type.operator"] = { fg = c.grey_fg2 },
	["@lsp.type.regexp"] = { fg = c.teal },
	["@lsp.mod.readonly"] = { italic = true },
	["@lsp.mod.deprecated"] = { strikethrough = true },
	["@lsp.mod.documentation"] = { fg = c.grey_fg2, italic = true },

	-- oil
	OilDir = { fg = c.folder_bg },
	OilDirIcon = { fg = c.folder_bg },
	OilFile = { fg = c.white },
	OilLink = { fg = c.teal, underline = true },
	OilCopy = { fg = c.green },
	OilMove = { fg = c.blue },
	OilChange = { fg = c.blue },
	OilCreate = { fg = c.green },
	OilDelete = { fg = c.red },
	OilHidden = { fg = c.grey_fg },

	-- snippets / overlays
	SnippetTabstop = { bg = "NONE" },
	SnippetTabstopActive = { bg = c.one_bg2 },
	MiniIndentscopeSymbol = { fg = c.one_bg3 },
	MiniCursorword = { bg = c.one_bg2 },
	MiniCursorwordCurrent = { bg = c.one_bg2 },

	-- statusline custom groups
	St_NormalMode = { fg = c.dim_silver, bg = c.statusline_bg },
	St_InsertMode = { fg = c.green, bg = c.statusline_bg },
	St_VisualMode = { fg = c.purple, bg = c.statusline_bg },
	St_ReplaceMode = { fg = c.red, bg = c.statusline_bg },
	St_CommandMode = { fg = c.silver, bg = c.statusline_bg },
	St_TerminalMode = { fg = c.teal, bg = c.statusline_bg },
	St_File = { fg = c.white, bg = c.statusline_bg },
	St_Git = { fg = c.nord_blue, bg = c.statusline_bg },
	St_DiagError = { fg = c.red, bg = c.statusline_bg },
	St_DiagWarn = { fg = c.yellow, bg = c.statusline_bg },
	St_DiagInfo = { fg = c.blue, bg = c.statusline_bg },
	St_DiagHint = { fg = c.teal, bg = c.statusline_bg },
	St_Lsp = { fg = c.silver, bg = c.statusline_bg },
	St_Pos = { fg = c.grey_fg2, bg = c.statusline_bg },

	-- health / debug
	healthError = { fg = c.red },
	healthSuccess = { fg = c.green },
	healthWarning = { fg = c.yellow },
	RedrawDebugClear = { fg = c.black, bg = c.yellow },
	RedrawDebugComposed = { fg = c.black, bg = c.green },
	RedrawDebugRecompose = { fg = c.black, bg = c.red },
}

for group, opts in pairs(groups) do
	hi(group, opts)
end

-- Telescope
local telescope = {
	TelescopeNormal = { fg = c.white, bg = c.black },
	TelescopeBorder = { fg = c.line, bg = c.black },
	TelescopeTitle = { fg = c.silver, bg = c.black },
	TelescopePreviewNormal = { fg = c.white, bg = c.black },
	TelescopePreviewBorder = { fg = c.line, bg = c.black },
	TelescopePreviewTitle = { fg = c.silver, bg = c.black },
	TelescopeResultsNormal = { fg = c.white, bg = c.black },
	TelescopeResultsBorder = { fg = c.line, bg = c.black },
	TelescopeResultsTitle = { fg = c.silver, bg = c.black },
	TelescopePromptNormal = { fg = c.white, bg = c.one_bg },
	TelescopePromptBorder = { fg = c.line, bg = c.one_bg },
	TelescopePromptTitle = { fg = c.silver, bg = c.one_bg },
	TelescopeSelection = { fg = c.bright_white, bg = c.one_bg2 },
	TelescopeSelectionCaret = { fg = c.silver, bg = c.one_bg2 },
	TelescopeMatching = { fg = c.bright_white },
	TelescopeMultiSelection = { fg = c.teal },
	TelescopeMultiIcon = { fg = c.teal },
}

for group, opts in pairs(telescope) do
	hi(group, opts)
end

-- blink.cmp
local blink = {
	BlinkCmpMenu = { fg = c.white, bg = c.one_bg },
	BlinkCmpMenuBorder = { fg = c.line, bg = c.one_bg },
	BlinkCmpMenuSelection = { fg = c.bright_white, bg = c.pmenu_bg },
	BlinkCmpScrollBarThumb = { bg = c.grey },
	BlinkCmpScrollBarGutter = { bg = c.one_bg },
	BlinkCmpLabel = { fg = c.white },
	BlinkCmpLabelMatch = { fg = c.bright_white },
	BlinkCmpLabelDetail = { fg = c.grey_fg2 },
	BlinkCmpLabelDescription = { fg = c.grey_fg2 },
	BlinkCmpKind = { fg = c.blue },
	BlinkCmpKindText = { fg = c.white },
	BlinkCmpKindMethod = { fg = c.blue },
	BlinkCmpKindFunction = { fg = c.blue },
	BlinkCmpKindConstructor = { fg = c.nord_blue },
	BlinkCmpKindField = { fg = c.teal },
	BlinkCmpKindVariable = { fg = c.white },
	BlinkCmpKindClass = { fg = c.nord_blue },
	BlinkCmpKindInterface = { fg = c.nord_blue },
	BlinkCmpKindModule = { fg = c.nord_blue },
	BlinkCmpKindProperty = { fg = c.teal },
	BlinkCmpKindUnit = { fg = c.yellow },
	BlinkCmpKindValue = { fg = c.yellow },
	BlinkCmpKindEnum = { fg = c.nord_blue },
	BlinkCmpKindKeyword = { fg = c.purple },
	BlinkCmpKindSnippet = { fg = c.teal },
	BlinkCmpKindColor = { fg = c.teal },
	BlinkCmpKindFile = { fg = c.blue },
	BlinkCmpKindReference = { fg = c.blue },
	BlinkCmpKindFolder = { fg = c.folder_bg },
	BlinkCmpKindEnumMember = { fg = c.yellow },
	BlinkCmpKindConstant = { fg = c.yellow },
	BlinkCmpKindStruct = { fg = c.nord_blue },
	BlinkCmpKindEvent = { fg = c.teal },
	BlinkCmpKindOperator = { fg = c.grey_fg2 },
	BlinkCmpKindTypeParameter = { fg = c.nord_blue },
	BlinkCmpDoc = { fg = c.white, bg = c.one_bg },
	BlinkCmpDocBorder = { fg = c.line, bg = c.one_bg },
	BlinkCmpSignatureHelp = { fg = c.white, bg = c.one_bg },
	BlinkCmpSignatureHelpBorder = { fg = c.line, bg = c.one_bg },
}

for group, opts in pairs(blink) do
	hi(group, opts)
end

-- nvim-cmp compatibility
local cmp = {
	CmpDocumentation = { fg = c.white, bg = c.one_bg },
	CmpDocumentationBorder = { fg = c.line, bg = c.one_bg },
	CmpItemAbbr = { fg = c.white },
	CmpItemAbbrDeprecated = { fg = c.grey_fg2, strikethrough = true },
	CmpItemAbbrMatch = { fg = c.bright_white },
	CmpItemAbbrMatchFuzzy = { fg = c.bright_white },
	CmpItemMenu = { fg = c.grey_fg2 },
	CmpItemKind = { fg = c.blue },
	CmpItemKindText = { fg = c.white },
	CmpItemKindMethod = { fg = c.blue },
	CmpItemKindFunction = { fg = c.blue },
	CmpItemKindConstructor = { fg = c.nord_blue },
	CmpItemKindField = { fg = c.teal },
	CmpItemKindVariable = { fg = c.white },
	CmpItemKindClass = { fg = c.nord_blue },
	CmpItemKindInterface = { fg = c.nord_blue },
	CmpItemKindModule = { fg = c.nord_blue },
	CmpItemKindProperty = { fg = c.teal },
	CmpItemKindUnit = { fg = c.yellow },
	CmpItemKindValue = { fg = c.yellow },
	CmpItemKindEnum = { fg = c.nord_blue },
	CmpItemKindKeyword = { fg = c.purple },
	CmpItemKindSnippet = { fg = c.teal },
	CmpItemKindColor = { fg = c.teal },
	CmpItemKindFile = { fg = c.blue },
	CmpItemKindReference = { fg = c.blue },
	CmpItemKindFolder = { fg = c.folder_bg },
	CmpItemKindEnumMember = { fg = c.yellow },
	CmpItemKindConstant = { fg = c.yellow },
	CmpItemKindStruct = { fg = c.nord_blue },
	CmpItemKindEvent = { fg = c.teal },
	CmpItemKindOperator = { fg = c.grey_fg2 },
	CmpItemKindTypeParameter = { fg = c.nord_blue },
}

for group, opts in pairs(cmp) do
	hi(group, opts)
end

-- common plugin surfaces
local plugins = {
	-- WhichKey
	WhichKey = { fg = c.silver },
	WhichKeyGroup = { fg = c.blue },
	WhichKeyDesc = { fg = c.white },
	WhichKeySeparator = { fg = c.grey_fg },
	WhichKeyFloat = { bg = c.black },
	WhichKeyValue = { fg = c.grey_fg2 },
	WhichKeyBorder = { fg = c.line, bg = c.black },
	WhichKeyIcon = { fg = c.grey_fg2 },
	WhichKeyIconAzure = { fg = c.blue },
	WhichKeyIconBlue = { fg = c.blue },
	WhichKeyIconCyan = { fg = c.teal },
	WhichKeyIconGreen = { fg = c.green },
	WhichKeyIconGrey = { fg = c.grey_fg2 },
	WhichKeyIconOrange = { fg = c.yellow },
	WhichKeyIconPurple = { fg = c.purple },
	WhichKeyIconRed = { fg = c.red },
	WhichKeyIconYellow = { fg = c.yellow },

	-- Lazy.nvim
	LazyNormal = { fg = c.white, bg = c.black },
	LazyButton = { fg = c.white, bg = c.one_bg2 },
	LazyButtonActive = { fg = c.bright_white, bg = c.one_bg3 },
	LazyH1 = { fg = c.bright_white, bg = c.one_bg3 },
	LazyH2 = { fg = c.silver },
	LazyComment = { fg = c.grey_fg2 },
	LazyCommit = { fg = c.blue },
	LazyCommitIssue = { fg = c.purple },
	LazyCommitScope = { fg = c.grey_fg2 },
	LazyCommitType = { fg = c.nord_blue },
	LazyDir = { fg = c.blue },
	LazyUrl = { fg = c.teal, underline = true },
	LazyReasonCmd = { fg = c.blue },
	LazyReasonEvent = { fg = c.teal },
	LazyReasonFt = { fg = c.nord_blue },
	LazyReasonImport = { fg = c.purple },
	LazyReasonKeys = { fg = c.yellow },
	LazyReasonPlugin = { fg = c.green },
	LazyReasonRuntime = { fg = c.purple },
	LazyReasonSource = { fg = c.blue },
	LazyReasonStart = { fg = c.green },
	LazySpecial = { fg = c.silver },
	LazyTaskOutput = { fg = c.white },
	LazyProgressDone = { fg = c.silver },
	LazyProgressTodo = { fg = c.grey },

	-- Mason.nvim
	MasonNormal = { fg = c.white, bg = c.black },
	MasonHeader = { fg = c.bright_white, bg = c.one_bg3 },
	MasonHeaderSecondary = { fg = c.silver, bg = c.one_bg2 },
	MasonHighlight = { fg = c.silver },
	MasonHighlightBlock = { fg = c.bright_white, bg = c.one_bg3 },
	MasonHighlightBlockBold = { fg = c.bright_white, bg = c.one_bg3 },
	MasonMuted = { fg = c.grey_fg2 },
	MasonMutedBlock = { fg = c.grey_fg2, bg = c.one_bg2 },
	MasonError = { fg = c.red },
	MasonWarning = { fg = c.yellow },
	MasonHeading = { fg = c.bright_white },

	-- Noice.nvim / notify.nvim
	NoiceCmdline = { fg = c.white },
	NoiceCmdlineIcon = { fg = c.silver },
	NoiceCmdlineIconSearch = { fg = c.blue },
	NoiceCmdlinePopup = { fg = c.white, bg = c.one_bg },
	NoiceCmdlinePopupBorder = { fg = c.line, bg = c.one_bg },
	NoiceCmdlinePopupBorderSearch = { fg = c.line, bg = c.one_bg },
	NoiceCmdlinePopupTitle = { fg = c.silver },
	NoiceConfirm = { fg = c.white, bg = c.one_bg },
	NoiceConfirmBorder = { fg = c.line, bg = c.one_bg },
	NoiceFormatConfirm = { fg = c.silver },
	NoiceFormatConfirmDefault = { fg = c.bright_white },
	NoiceFormatProgressDone = { fg = c.silver, bg = c.one_bg2 },
	NoiceFormatProgressTodo = { fg = c.grey, bg = c.one_bg2 },
	NoiceLspProgressClient = { fg = c.blue },
	NoiceLspProgressSpinner = { fg = c.silver },
	NoiceLspProgressTitle = { fg = c.white },
	NotifyERRORBorder = { fg = c.red },
	NotifyWARNBorder = { fg = c.yellow },
	NotifyINFOBorder = { fg = c.blue },
	NotifyDEBUGBorder = { fg = c.grey_fg2 },
	NotifyTRACEBorder = { fg = c.purple },
	NotifyERRORIcon = { fg = c.red },
	NotifyWARNIcon = { fg = c.yellow },
	NotifyINFOIcon = { fg = c.blue },
	NotifyDEBUGIcon = { fg = c.grey_fg2 },
	NotifyTRACEIcon = { fg = c.purple },
	NotifyERRORTitle = { fg = c.red },
	NotifyWARNTitle = { fg = c.yellow },
	NotifyINFOTitle = { fg = c.blue },
	NotifyDEBUGTitle = { fg = c.grey_fg2 },
	NotifyTRACETitle = { fg = c.purple },
	NotifyBackground = { bg = c.black },

	-- Trouble
	TroubleNormal = { fg = c.white, bg = c.black },
	TroubleNormalNC = { fg = c.grey_fg2, bg = c.black },
	TroubleText = { fg = c.white },
	TroubleCount = { fg = c.silver, bg = c.one_bg2 },
	TroubleDirectory = { fg = c.nord_blue },
	TroubleFile = { fg = c.white },
	TroubleFoldIcon = { fg = c.grey_fg2 },
	TroubleIndent = { fg = c.grey },
	TroubleLocation = { fg = c.grey_fg2 },
	TroublePreview = { bg = c.one_bg2 },

	-- Treesitter context
	TreesitterContext = { bg = c.black2 },
	TreesitterContextLineNumber = { fg = c.grey_fg2, bg = c.black2 },
	TreesitterContextBottom = { sp = c.line, underline = true },

	-- NvimTree / Neo-tree
	NvimTreeNormal = { fg = c.white, bg = c.black },
	NvimTreeNormalNC = { fg = c.white, bg = c.black },
	NvimTreeFolderName = { fg = c.nord_blue },
	NvimTreeOpenedFolderName = { fg = c.nord_blue },
	NvimTreeRootFolder = { fg = c.silver },
	NvimTreeGitDirty = { fg = c.blue },
	NvimTreeGitNew = { fg = c.green },
	NvimTreeGitDeleted = { fg = c.red },
	NvimTreeIndentMarker = { fg = c.grey },
	NvimTreeImageFile = { fg = c.teal },
	NvimTreeSymlink = { fg = c.teal },
	NeoTreeNormal = { fg = c.white, bg = c.black },
	NeoTreeNormalNC = { fg = c.white, bg = c.black },
	NeoTreeDirectoryName = { fg = c.nord_blue },
	NeoTreeDirectoryIcon = { fg = c.nord_blue },
	NeoTreeFileName = { fg = c.white },
	NeoTreeFileIcon = { fg = c.grey_fg2 },
	NeoTreeGitAdded = { fg = c.green },
	NeoTreeGitModified = { fg = c.blue },
	NeoTreeGitDeleted = { fg = c.red },
	NeoTreeGitUntracked = { fg = c.grey_fg2 },
	NeoTreeIndentMarker = { fg = c.grey },

	-- Snacks.nvim common groups
	SnacksPicker = { fg = c.white, bg = c.black },
	SnacksPickerBorder = { fg = c.line, bg = c.black },
	SnacksPickerTitle = { fg = c.silver, bg = c.black },
	SnacksPickerInput = { fg = c.white, bg = c.one_bg },
	SnacksPickerPrompt = { fg = c.silver, bg = c.one_bg },
	SnacksPickerMatch = { fg = c.bright_white },
	SnacksPickerSelected = { fg = c.bright_white, bg = c.one_bg2 },
	SnacksDashboardHeader = { fg = c.silver },
	SnacksDashboardIcon = { fg = c.blue },
	SnacksDashboardDesc = { fg = c.white },
	SnacksDashboardKey = { fg = c.silver },
	SnacksDashboardFooter = { fg = c.grey_fg2 },
}

for group, opts in pairs(plugins) do
	hi(group, opts)
end

-- terminal colors
for i, color in ipairs(M.ansi) do
	vim.g["terminal_color_" .. (i - 1)] = color
end

-- Strict palette enforcement -------------------------------------------------
-- Plugin highlight groups loaded after a colorscheme can reintroduce bright
-- defaults. This pass remaps any existing unknown color into the Selene palette.
-- Disable with: vim.g.selene_strict = false
local function hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	if #hex ~= 6 then
		return nil
	end

	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function int_to_hex(n)
	if not n then
		return nil
	end
	return string.format("#%06x", n)
end

local function norm(hex)
	if not hex then
		return nil
	end
	hex = tostring(hex):upper()
	if hex:sub(1, 1) ~= "#" then
		hex = "#" .. hex
	end
	return hex
end

local fg_palette = {
	c.white,
	c.bright_white,
	c.silver,
	c.dim_silver,
	c.grey_fg2,
	c.grey_fg,
	c.red,
	c.baby_pink,
	c.green,
	c.vibrant_green,
	c.yellow,
	c.sun,
	c.blue,
	c.nord_blue,
	c.purple,
	c.lavender,
	c.teal,
	c.cyan,
}

local bg_palette = {
	c.black,
	c.black2,
	c.one_bg,
	c.one_bg2,
	c.one_bg3,
	c.line,
	c.selection_bg,
	c.pmenu_bg,
	c.accent,
}

local fg_allowed = {}
local bg_allowed = {}
for _, color in ipairs(fg_palette) do
	fg_allowed[norm(color)] = true
end
for _, color in ipairs(bg_palette) do
	bg_allowed[norm(color)] = true
end

local function dist(a, b)
	local ar, ag, ab = hex_to_rgb(a)
	local br, bg, bb = hex_to_rgb(b)
	if not ar or not br then
		return math.huge
	end

	-- Slightly favor luminance similarity over hue. This keeps toxic defaults
	-- from mapping to something visually much brighter than intended.
	local dl = (0.2126 * ar + 0.7152 * ag + 0.0722 * ab) - (0.2126 * br + 0.7152 * bg + 0.0722 * bb)
	return (ar - br) ^ 2 + (ag - bg) ^ 2 + (ab - bb) ^ 2 + (dl ^ 2 * 0.45)
end

local function nearest(hex, palette)
	local best = palette[1]
	local best_d = math.huge
	for _, color in ipairs(palette) do
		local d = dist(hex, color)
		if d < best_d then
			best = color
			best_d = d
		end
	end
	return best
end

local function sanitize_fg(value)
	local hex = norm(int_to_hex(value))
	if not hex or fg_allowed[hex] then
		return value
	end
	return tonumber(nearest(hex, fg_palette):sub(2), 16)
end

local function sanitize_sp(value)
	return sanitize_fg(value)
end

local function sanitize_bg(value)
	local hex = norm(int_to_hex(value))
	if not hex or bg_allowed[hex] then
		return value
	end

	local r, g, bl = hex_to_rgb(hex)
	if not r then
		return value
	end
	local lum = (0.2126 * r + 0.7152 * g + 0.0722 * bl) / 255

	if lum < 0.05 then
		return tonumber(c.black2:sub(2), 16)
	elseif lum < 0.12 then
		return tonumber(c.one_bg:sub(2), 16)
	elseif lum < 0.25 then
		return tonumber(c.one_bg2:sub(2), 16)
	end

	return tonumber(c.one_bg3:sub(2), 16)
end

function M.enforce_palette()
	if vim.g.selene_strict == false or vim.g.selene_strict == 0 then
		return
	end

	local ok, all = pcall(vim.api.nvim_get_hl, 0, {})
	if not ok or type(all) ~= "table" then
		return
	end

	for name, opts in pairs(all) do
		if type(name) == "string" and type(opts) == "table" and not opts.link then
			local changed = false
			local new = vim.deepcopy(opts)

			if new.fg then
				local fg = sanitize_fg(new.fg)
				if fg ~= new.fg then
					new.fg = fg
					changed = true
				end
			end

			if new.bg then
				local bg = sanitize_bg(new.bg)
				if bg ~= new.bg then
					new.bg = bg
					changed = true
				end
			end

			if new.sp then
				local sp = sanitize_sp(new.sp)
				if sp ~= new.sp then
					new.sp = sp
					changed = true
				end
			end

			if changed then
				pcall(hi, name, new)
			end
		end
	end
end

local function schedule_enforce()
	vim.schedule(M.enforce_palette)
	vim.defer_fn(M.enforce_palette, 50)
	vim.defer_fn(M.enforce_palette, 250)
	vim.defer_fn(M.enforce_palette, 1000)
end

local group = vim.api.nvim_create_augroup("SeleneStrictPalette", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "FileType", "BufWinEnter", "LspAttach" }, {
	group = group,
	callback = schedule_enforce,
})
vim.api.nvim_create_autocmd("User", {
	group = group,
	pattern = { "VeryLazy", "LazyLoad", "LazyDone" },
	callback = schedule_enforce,
})

vim.api.nvim_create_user_command("SeleneEnforce", M.enforce_palette, {})
vim.api.nvim_create_user_command("SeleneInspect", function()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local syn = vim.fn.synIDattr(vim.fn.synID(line, col, 1), "name")
	local trans = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(line, col, 1)), "name")
	local ts = {}
	pcall(function()
		ts = vim.treesitter.get_captures_at_cursor(0)
	end)
	print(vim.inspect({ syntax = syn, translated = trans, treesitter = ts }))
end, {})

schedule_enforce()

return M
