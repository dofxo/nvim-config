return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Loads VSCode-style snippets from installed plugins (e.g., friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Add custom EJS snippets

		luasnip.add_snippets("html", {
			luasnip.parser.parse_snippet("test", "<!-- Test snippet: ${1:test} -->"),
			luasnip.parser.parse_snippet("include", "<%- include(${1:'path'}) %>"),
			luasnip.parser.parse_snippet("forEach", "<% ${1:array}.forEach(${2:item} => { %>${3} <% }); %>"),
			luasnip.parser.parse_snippet("if", "<% if (${1:condition}) { %>${2} <% } %>"),
			luasnip.parser.parse_snippet("else", "<% else { %>${1} <% } %>"),
			luasnip.parser.parse_snippet("for", "<% for (let i = 0; i < ${1:array}.length; i++) { %>${2} <% } %>"),
			luasnip.parser.parse_snippet("each", "<% ${1:array}.forEach(${2:item} => { %>${3} <% }); %>"),
			luasnip.parser.parse_snippet("set", "<% let ${1:variable} = ${2:value}; %>"),

			luasnip.parser.parse_snippet("variable", "<%= ${1:expression} %>"),
			luasnip.parser.parse_snippet("empty-ejs", "<% ${1:code} %>"),
		})

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "codeium" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
