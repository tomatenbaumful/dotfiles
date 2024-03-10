return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettier", "prettier" } },
			typescript = { { "prettier", "prettier" } },
		},

		-- Set up format-on-save
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	config = function(_, opts)
		local conform = require("conform")

		conform.setup(opts)

		-- Customize prettier args
		require("conform.formatters.prettier").args = function(self, ctx)
			local args = { "--stdin-filepath", "$FILENAME" }
			local localPrettierConfig = vim.fs.find(".prettierrc.json", {
				upward = true,
				path = ctx.dirname,
				type = "file",
			})[1]
			local globalPrettierConfig = vim.fs.find(".prettierrc.json", {
				path = vim.fn.expand("~/.config/nvim"),
				type = "file",
			})[1]

			-- Project config takes precedence over global config
			if localPrettierConfig then
				vim.list_extend(args, { "--config", localPrettierConfig })
			elseif globalPrettierConfig then
				vim.list_extend(args, { "--config", globalPrettierConfig })
			end

			local isUsingTailwind = vim.fs.find("tailwind.config.js", {
				upward = true,
				path = ctx.dirname,
				type = "file",
			})[1]
			local localTailwindcssPlugin = vim.fs.find("node_modules/prettier-plugin-tailwindcss/dist/index.mjs", {
				upward = true,
				path = ctx.dirname,
				type = "file",
			})[1]

			if localTailwindcssPlugin then
				vim.list_extend(args, { "--plugin", localTailwindcssPlugin })
			else
				if isUsingTailwind then
					vim.notify(
						"Tailwind was detected for your project. You can really benefit from automatic class sorting. Please run npm i -D prettier-plugin-tailwindcss",
						vim.log.levels.WARN
					)
				end
			end

			return args
		end
	end,
}
