local image_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }

local load = require("lazy").plugin({
	src = "https://github.com/3rd/image.nvim",
	ft = {
		"markdown",
		"norg",
		"html",
		"css",
		"opencode_output",
	},
	config = function()
		require("image").setup({
			backend = "kitty",
			processor = "magick_cli",
			tmux_show_only_in_active_window = true,
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki", "opencode_output" },
				},
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
				},
				html = { enabled = true },
				css = { enabled = true },
			},
			max_width_window_percentage = 100,
			max_height_window_percentage = 90,
			window_overlap_clear_enabled = true,
			hijack_file_patterns = image_patterns,
		})
	end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
	pattern = image_patterns,
	callback = load,
})
