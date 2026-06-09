local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Explorer" })

map("n", "<Up>", function()
	vim.diagnostic.jump({
		count = -1,
		on_jump = function()
			vim.diagnostic.open_float({ focus = false, scope = "cursor" })
		end,
	})
end, { desc = "Previous diagnostic" })

map("n", "<Down>", function()
	vim.diagnostic.jump({
		count = 1,
		on_jump = function()
			vim.diagnostic.open_float({ focus = false, scope = "cursor" })
		end,
	})
end, { desc = "Next diagnostic" })

map("n", "<Left>", function()
	require("gitsigns").prev_hunk()
end, { desc = "Previous Git hunk" })

map("n", "<Right>", function()
	require("gitsigns").next_hunk()
end, { desc = "Next Git hunk" })

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Window up" })

map("n", "<leader>ge", "oif err != nil {<CR>}<ESC>ko", { desc = "Golang err snippet" })
map("n", "<C-a>", "<Nop>")

map("n", "<leader>mr", "<cmd>RenderMarkdown buf_toggle<CR>", { desc = "Toggle markdown render for buffer" })
