vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/nvim-mini/mini.indentscope",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.comment",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/sudo-tee/opencode.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.plugins")
require("config.lsp")
require("config.dadbod")

vim.cmd.colorscheme("warm")
require("config.statusline").setup()
