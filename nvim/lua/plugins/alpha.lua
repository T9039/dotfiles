return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                       ]],
			[[    ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█ ]],
			[[     █  █▀   ▀  █   █      █  ██ █ █ █ ]],
			[[ ██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ ]],
			[[ █ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ]],
			[[ █  █ █ ▀███▀           █  █   ▐    █  ]],
			[[ █   ██                  █▐        ▀   ]],
			[[                         ▐             ]],
			[[                                       ]],
			[[                 @T9039                 ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
		}

		dashboard.section.footer.val = {
			"LazyVim • ArchLinux • 🖤",
		}

		dashboard.config.layout = {
			{ type = "padding", val = 3 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		-- Ensure it's centered
		dashboard.config.opts = {
			margin = 5,
			position = "center",
		}

		alpha.setup(dashboard.config)
	end,
}
