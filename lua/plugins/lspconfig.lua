return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"neovim/nvim-lsp",
			"hrsh7th/nvim-cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvimtools/none-ls.nvim",
			"jay-babu/mason-null-ls.nvim",
			"SmiteshP/nvim-navic",
		},
		event = { "VeryLazy" },
		config = function()
			-- Virtual Text Config
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
				},
				-- virtual_text = false,
				severity_sort = true,
				update_in_insert = true,
				float = {
					source = "always",
				},
			})

			-- Signs Config
			local signs = { Error = "e", Warn = "w", Hint = "h", Info = "i" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Formatting with none-ls
			local lsp_formatting = function(bufnr)
				vim.lsp.buf.format({
					bufnr = bufnr,
					timeout_ms = 5000,
				})
			end

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			local navic = require("nvim-navic")
			navic.setup({
				lsp = {
					auto_attach = true,
				},
				icons = {
					File = "",
					Module = "",
					Namespace = "",
					Package = "",
					Class = "",
					Method = "",
					Property = "",
					Field = "",
					Constructor = "",
					Enum = "",
					Interface = "",
					Function = "",
					Variable = "",
					Constant = "",
					String = "",
					Number = "",
					Boolean = "",
					Array = "",
					Object = "",
					Key = "",
					Null = "",
					EnumMember = "",
					Struct = "",
					Event = "",
					Operator = "",
					TypeParameter = "",
				},
			})

			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				-- if client.supports_method("textDocument/formatting") then
				-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				-- 	vim.api.nvim_create_autocmd("BufWritePre", {
				-- 		group = augroup,
				-- 		buffer = bufnr,
				-- 		callback = function()
				-- 			lsp_formatting(bufnr)
				-- 		end,
				-- 	})
				-- end

				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end

				-- Important: Add these mappings in which key config
				-- Code navigation
				vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>gk", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>gK", vim.lsp.buf.signature_help, opts)

				-- Code actions
				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>cf", function()
					lsp_formatting(bufnr)
				end, opts)
			end

			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Lua
					null_ls.builtins.formatting.stylua,
					-- Ruby
					null_ls.builtins.formatting.rubocop,
					-- JS
					null_ls.builtins.formatting.prettierd,
				},
				on_attach = on_attach,
			})

			require("mason-null-ls").setup({
				automatic_installation = false,
				ensure_installed = {
					"stylua", -- Lua Formatting
					"rubocop", -- Ruby Formatting
					"prettierd", -- Javascript Formatting
					"ruff", -- Python Linter
					-- "black", -- Python Formatting
				},
			})

			-- Mason Config
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "+",
						package_pending = "~",
						package_uninstalled = "-",
					},
				},
			})

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"solargraph", -- Ruby
					"rust_analyzer", -- Rust
					"clangd", -- C
					"jsonls", -- JSON
					"html", -- HTML
					"tsserver", -- Typescript
					"tailwindcss", -- Tailwindcss
					"pyright", -- Python
				},
			})

			-- Setup cmp integration
			local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local default_server_options = {
				capabilities = default_capabilities,
				on_attach = on_attach,
			}

			local lspconfig = require("lspconfig")

			-- Setup All Avaible Servers
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup(default_server_options)
				end,
				-- Custom Servers Configuration
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup(vim.tbl_deep_extend("force", {
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
							},
						},
					}, default_server_options))
				end,
				["solargraph"] = function()
					lspconfig["solargraph"].setup(vim.tbl_deep_extend("force", {
						settings = {
							diagnostics = false,
						},
					}, default_server_options))
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
		event = { "VeryLazy" },
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.close(),
					["<C-c>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
				}, {
					{ name = "buffer" },
				}),
				window = {
					completion = {
						padding = 1,
					},
					documentation = {
						padding = 1,
					},
				},
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
