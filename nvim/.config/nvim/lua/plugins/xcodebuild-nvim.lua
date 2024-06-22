return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
	},
	lazy = true,
	event = "VeryLazy",
	opts = {
		code_coverage = {
			enabled = true,
		},
	},
	config = function()
		require("xcodebuild").setup({
			vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" }),
			vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" }),
			vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" }),
			vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" }),
			vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" }),
			vim.keymap.set("n", "<leader>xf", "<cmd>XcodebuildTestTarget<cr>", { desc = "Run This Test Target" }),
			vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" }),
			vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" }),
			vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" }),
			vim.keymap.set(
				"n",
				"<leader>xs",
				"<cmd>XcodebuildFailingSnapshots<cr>",
				{ desc = "Show Failing Snapshots" }
			),
			vim.keymap.set(
				"n",
				"<leader>xc",
				"<cmd>XcodebuildToggleCodeCoverage<cr>",
				{ desc = "Toggle Code Coverage" }
			),
			vim.keymap.set(
				"n",
				"<leader>xC",
				"<cmd>XcodebuildShowCodeCoverageReport<cr>",
				{ desc = "Show Code Coverage Report" }
			),
			vim.keymap.set("n", "[r", "<cmd>XcodebuildJumpToPrevCoverage<cr>", { desc = "Jump To Previous Coverage" }),
			vim.keymap.set("n", "]r", "<cmd>XcodebuildJumpToNextCoverage<cr>", { desc = "Jump To Next Coverage" }),
			vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" }),
		})
	end,
}
