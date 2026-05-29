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
				unreachable = false,
				unusedparams = false,
				shadow = false,
				nilness = false,
				unusedwrite = false,
				useany = false,
			},
			hoverKind = "FullDocumentation",
			staticcheck = false,
			semanticTokens = true,

			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

vim.lsp.config("golangci_lint_ls", {
	cmd = { "golangci-lint-langserver" },
	root_markers = { ".golangci.yml", ".golangci.yaml", "go.mod", ".git" },
	filetypes = { "go", "gomod" },
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--output.json.path",
			"stdout",
			"--show-stats=false",
			"--issues-exit-code=1",
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"golangci_lint_ls",
	-- "basedpyright",
	-- "clangd",
	-- "cssls",
	-- "html",
	"rust_analyzer",
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
		-- map("n", "<leader>f", function()
		-- 	require("conform").format({ async = true, lsp_format = "fallback" })
		-- end, "Format buffer")
	end,
})
