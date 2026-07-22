local opt = vim.opt
local o = vim.o

o.termguicolors = true
o.background = "dark"

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.wrap = false
opt.showtabline = 0

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 6
opt.sidescrolloff = 6

opt.signcolumn = "yes"

opt.updatetime = 200
opt.timeoutlen = 400

opt.completeopt = { "menu", "menuone", "noselect" }
opt.fillchars = { eob = " " }
opt.cursorline = true
opt.showmode = false
opt.ruler = false
opt.laststatus = 3

opt.shortmess:append("I")

o.cursorlineopt = "both"
o.winborder = "single"

-- прозрачность floating окон (0 = непрозрачные)
-- opt.winblend = 10

-- прозрачность popup меню (completion)
-- opt.pumblend = 10

-- максимальная высота popup меню
-- opt.pumheight = 10

-- показывает невидимые символы (табы, пробелы)
-- opt.list = true

-- как отображать невидимые символы
-- opt.listchars = {
--   tab = "→ ",
--   trail = "·",
--   nbsp = "␣",
-- }

-- подсветка результатов поиска
-- opt.hlsearch = true

-- инкрементальный поиск (подсветка по мере ввода)
-- opt.incsearch = true

-- колонка ограничения длины строки
-- opt.colorcolumn = "100"

-- другой стиль границ окон
-- o.winborder = "rounded"

-- кастомный курсор (разные формы в разных режимах)
-- opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- fold (сворачивание кода)
-- opt.foldcolumn = "0"
-- opt.foldlevel = 99
-- opt.foldmethod = "indent"
