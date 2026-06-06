-- Eagerly loaded plugins. Lazily loaded ones live in their own files in this
-- directory and are auto-required by the loop at the bottom.
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",

	"https://github.com/stevearc/oil.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/lewis6991/gitsigns.nvim",

	"https://github.com/brenoprata10/nvim-highlight-colors",

	"https://github.com/stevearc/conform.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",

	"https://github.com/nvim-mini/mini.indentscope",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.comment",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.icons",

	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("gitsigns").setup({
	worktrees = {
		{
			toplevel = vim.env.HOME,
			gitdir = vim.env.HOME .. "/.dotfiles",
		},
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		-- json = { "jq" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("oil").setup({
	default_file_explorer = true,
	columns = { "icon" },
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<CR>"] = "actions.select",
		["-"] = "actions.parent",
		["<C-s>"] = "actions.select_vsplit",
		["<C-h>"] = false,
		["<C-l>"] = false,
		["<C-j>"] = false,
		["<C-k>"] = false,
	},
})

require("nvim-autopairs").setup({
	check_ts = false,
	disable_filetype = { "TelescopePrompt" },
})

require("blink.cmp").setup({
	keymap = {
		preset = "default",

		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<CR>"] = { "accept", "fallback" },

		["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 150,
			window = { border = "single" },
		},
		ghost_text = { enabled = false },
		menu = { border = "single" },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = {
		implementation = "lua",
	},
})

require("nvim-highlight-colors").setup({})

require("mini.indentscope").setup({
	symbol = "│",
	options = { try_as_border = true },
	draw = {
		delay = 0,
		animation = require("mini.indentscope").gen_animation.none(),
	},
})

require("mini.surround").setup()
require("mini.comment").setup()
require("mini.ai").setup()

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"oil",
		"TelescopePrompt",
		"dashboard",
		"alpha",
		"terminal",
		"NvimTree",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})

require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
	anti_conceal = { enabled = false },
	file_types = { "markdown", "opencode_output" },
})

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

-- Auto-load every lazy plugin spec in this directory (each file registers its
-- own triggers via require("lazy").plugin{...}).
for _, path in ipairs(vim.api.nvim_get_runtime_file("lua/plugins/*.lua", true)) do
	local name = path:match("([^/]+)%.lua$")
	if name ~= "init" then
		require("plugins." .. name)
	end
end
