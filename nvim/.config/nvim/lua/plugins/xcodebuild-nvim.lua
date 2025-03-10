local progress_handle

return {
	enabled = true,
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = true,
	event = "VeryLazy",
	keys = {
		{ "<leader>t",  "<cmd>ToggleTerm<cr>",                         desc = "Open a terminal" },
		{ "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>",               desc = "Toggle Xcodebuild Logs" },
		{ "<leader>xb", "<cmd>XcodebuildBuild<cr>",                    desc = "Build Project" },
		{ "<leader>xr", "<cmd>XcodebuildBuildRun<cr>",                 desc = "Build & Run Project" },
		{ "<leader>X",  "<cmd>XcodebuildPicker<cr>",                   desc = "Show All Xcodebuild Actions" },
		{ "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>",             desc = "Select Device" },
		{ "<leader>xs", "<cmd>XcodebuildSelectScheme<cr>",             desc = "Select Device" },
		{ "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>",       desc = "Toggle Code Coverage" },
		{ "<leader>xC", "<cmd>XcodebuildToggleCodeCoverageReport<cr>", desc = "Show Code Coverage Report" },
		{ "<leader>xq", "<cmd>Telescope quickfix<cr>",                 desc = "Show QuickFix List" },
	},
	opts = {
		code_coverage = {
			enabled = true,
		},
		commands = {
			extra_build_args = { "-parallelizeTargets" },
		},
		show_build_progress_bar = false,
		logs = {
			auto_open_on_failed_build = false,
			notify = function(message, severity)
				local fidget = require("fidget")
				if progress_handle then
					progress_handle.message = message
					if not message:find("Loading") then
						progress_handle:finish()
						progress_handle = nil
						if vim.trim(message) ~= "" then
							fidget.notify(message, severity)
						end
					end
				else
					fidget.notify(message, severity)
				end
			end,
			notify_progress = function(message)
				local progress = require("fidget.progress")

				if progress_handle then
					progress_handle.title = ""
					progress_handle.message = message
				else
					progress_handle = progress.handle.create({
						message = message,
						lsp_client = { name = "xcodebuild.nvim" },
					})
				end
			end,
		},
		integrations = {
			xcodebuild_offline = {
				enabled = false, -- improves build time (requires configuration, see `:h xcodebuild.xcodebuild-offline`)
			},
			xcode_build_server = {
				enabled = true, -- run "xcode-build-server config" when scheme changes
				guess_scheme = false, -- run "xcode-build-server config" with the scheme matching the current file's target
			},
			neo_tree = {
				enabled = true, -- enable updating Xcode project files when using neo-tree.nvim
			},
			oil_nvim = {
				enabled = true, -- enable updating Xcode project files when using oil.nvim
			},
		}
	},
	config = function(_, opts)
		require("xcodebuild").setup(opts)
	end,
}
