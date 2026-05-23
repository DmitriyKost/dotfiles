vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	severity_sort = true,
	float = {
		border = "single",
		source = "if_many",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

local wow_api = vim.fn.expand("~/.local/share/wow-api/Annotations")

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					[wow_api] = true,
				},
				maxPreload = 1000,
				preloadFileSize = 150,
				checkThirdParty = false,
			},
			diagnostics = {
				globals = {
					"vim",
					"CreateFrame",
					"C_Timer",
					"C_QuestLog",
					"Enum",
					"UIParent",
				},
			},
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = false,
			analyses = {
				unusedparams = true,
			},
			hoverKind = "FullDocumentation",
			staticcheck = true,
			semanticTokens = true,
		},
	},
})

-- vim.lsp.config("basedpyright", {})
-- vim.lsp.config("clangd", {})
-- vim.lsp.config("cssls", {})
-- vim.lsp.config("html", {})
-- vim.lsp.config("jsonls", {})
-- vim.lsp.config("marksman", {})
-- vim.lsp.config("rust_analyzer", {})
-- vim.lsp.config("ts_ls", {})
-- vim.lsp.config("zls", {})

vim.lsp.enable({
	"lua_ls",
	"gopls",
	-- "basedpyright",
	-- "clangd",
	-- "cssls",
	-- "html",
	-- "jsonls",
	-- "marksman",
	"rust_analyzer",
	-- "ts_ls",
	-- "zls",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my_lsp_attach", { clear = true }),
	callback = function(args)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "Hover documentation")
		map("n", "gd", vim.lsp.buf.definition, "Goto definition")
		map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
		map("n", "gr", vim.lsp.buf.references, "Goto references")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
		map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
		map("n", "<leader>f", function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, "Format buffer")
	end,
})
