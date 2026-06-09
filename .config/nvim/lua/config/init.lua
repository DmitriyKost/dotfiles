vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.autocmds")
require("config.keymaps")

require("plugins")

require("config.lsp")

vim.cmd.colorscheme("warm")
require("config.statusline").setup()
