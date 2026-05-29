require("config.lazy").plugin({
	src = "https://github.com/sudo-tee/opencode.nvim",
	cmd = { "Opencode" },
	keys = {
		{ "<leader>oo", "Opencode open_output", desc = "Open output window" },
		{ "<leader>og", "Opencode toggle", mode = { "n", "v" }, desc = "Toggle Opencode window" },
	},
	config = function()
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
	end,
})
