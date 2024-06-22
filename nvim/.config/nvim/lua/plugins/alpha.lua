return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		require("alpha.term")

		local logo = {
			[[                                                    ]],
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			[[                                                    ]],
		}

		local function footer()
			local stats = require("lazy").stats()
			local pluginsLoaded = stats.loaded
			local totalPluginsCount = stats.count

			local datetime = os.date(" %d-%m-%Y   %H:%M:%S")

			return pluginsLoaded .. "/" .. totalPluginsCount .. " plugins" .. " " .. datetime
		end

		dashboard.section.header.val = logo
		dashboard.section.buttons.val = {
			dashboard.button("n", " > New File", "<cmd>ene<CR>"),
			dashboard.button("f", "󰱼 > Find Files", "<cmd>Telescope find_files<CR>"),
			dashboard.button("g", " > Find grep", "<cmd>Telescope live_grep <CR>"),
			dashboard.button("c", " > Configuration", "<cmd>edit ~/.config/nvim/init.lua<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
			dashboard.button("l", "󰚰 > LazyUI", "<cmd>Lazy <CR>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end

		dashboard.section.header.opts.hl = "Function"
		dashboard.section.buttons.opts.hl = "Identifier"
		dashboard.section.footer.opts.hl = "Function"
		dashboard.opts.layout[1].val = 4

		dashboard.section.footer.val = footer()
		dashboard.section.footer.opts.hl = "Constant"

		return dashboard
	end,
	config = function(_, dashboard)
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end
		require("alpha").setup(dashboard.opts)
	end,
}
