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

require("telescope").setup({})

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
	anti_conceal = { enabled = false },
	file_types = { "markdown", "opencode_output" },
})

require("opencode").setup({
	preferred_picker = "telescope",
	preferred_completion = "blink",
	default_global_keymaps = true,
	default_mode = "build",
	keymap_prefix = "<leader>o",

	ui = {
		position = "right",
		window_width = 0.50,
		zoom_width = 0.80,
	},

	opencode_executable = "opencode",
})
