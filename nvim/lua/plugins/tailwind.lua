return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {},
			},
		},
	},

	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		opts = function(_, opts)
			-- Ensure formatting exists
			opts.formatting = opts.formatting or {}

			-- Keep reference to any existing formatter
			local format_kinds = opts.formatting.format

			-- Wrap formatter to add Tailwind colorizer
			opts.formatting.format = function(entry, item)
				if format_kinds then
					format_kinds(entry, item) -- keep existing formatting (like icons)
				end
				return require("tailwindcss-colorizer-cmp").formatter(entry, item)
			end
		end,
	},
}
