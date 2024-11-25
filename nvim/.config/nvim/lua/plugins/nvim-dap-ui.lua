return {
	"rcarriga/nvim-dap-ui",
	lazy = true,
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	opts = {
		controls = {
			element = "repl",
			enabled = true,
		},
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		icons = { collapsed = "", expanded = "", current_frame = "" },
		layouts = {
			{
				elements = {
					{ id = "stacks",      size = 0.25 },
					{ id = "scopes",      size = 0.25 },
					{ id = "breakpoints", size = 0.25 },
					{ id = "watches",     size = 0.25 },
				},
				position = "left",
				size = 45,
			},
			{
				elements = {
					{ id = "repl",    size = 0.4 },
					{ id = "console", size = 0.6 },
				},
				position = "bottom",
				size = 10,
			},
		},
	},
	config = function(_, opts)
		require("dapui").setup(opts)

		local dap, dapui = require("dap"), require("dapui")

		vim.keymap.set("n", "<leader>lt", dapui.toggle, { desc = "Debug UI Toggle" })

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
