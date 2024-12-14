return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

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

		require("cmp").setup.filetype("txt", {
			enabled = false,
		})

		cmp.setup({
			enabled = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

				-- Disable for unnamed buffers or 'oil' filetype
				if bufname == "" or filetype == "oil" then
					return false
				end
				return true
			end,
			-- Other cmp configuration here
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<C-a>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "codeium" }, -- file system paths
				{ name = "tailwindcss" },
			}),
		})
	end,
}
