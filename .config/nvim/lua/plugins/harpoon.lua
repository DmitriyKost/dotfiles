local lazy = require("lazy")

lazy.plugin({
	src = {
		{
			src = "https://github.com/ThePrimeagen/harpoon",
			version = "harpoon2",
		},
	},

	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon add file",
		},
		{
			"<leader>h",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon menu",
		},

		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon 1",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon 2",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon 3",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon 4",
		},

		{
			"<leader>hn",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon next",
		},
		{
			"<leader>hp",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon previous",
		},
	},

	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		harpoon:extend(require("harpoon.extensions").builtins.highlight_current_file())
	end,
})
