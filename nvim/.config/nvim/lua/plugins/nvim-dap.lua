local function setBreakpointIcons()
	local define = vim.fn.sign_define
	define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
	define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
	define("DapStopped", { text = "", texthl = "DiagnosticOk", linehl = "", numhl = "" })
	define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
	define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"wojciech-kulik/xcodebuild.nvim"
	},
	event = "VeryLazy",
	lazy = true,
	config = function()
		local dap = require("dap")
		local xcodebuild = require("xcodebuild.integrations.dap")
		local codelldbPath = os.getenv("HOME") .. "/Code/Tools/codelldb/extension/adapter/codelldb"

		xcodebuild.setup(codelldbPath)

		setBreakpointIcons()

		vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
		vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
		vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
		vim.keymap.set("n", "<leader>sb", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })

		vim.keymap.set("n", "<leader>dc", dap.continue)
		vim.keymap.set("n", "<leader>ds", dap.step_over)
		vim.keymap.set("n", "<leader>di", dap.step_into)
		vim.keymap.set("n", "<leader>do", dap.step_out)
		vim.keymap.set("n", "<C-s-b>", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set(
			"n",
			"<Leader>dx",
			function()
				dap.terminate()
				require("xcodebuild.actions").cancel()

				local success, dapui = pcall(require, "dapui")
				if success then
					dapui.close()
				end
			end,
			{
				desc = "Terminate Debugger"
			}
		)
	end,
}
