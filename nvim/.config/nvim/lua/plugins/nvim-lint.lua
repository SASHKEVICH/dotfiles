local cachedConfig = nil
local searchedForConfig = false

local cachedSwiftlintPath = nil
local searchedForSwiftlint = false

local function get_tools_path()
	return vim.fn.glob(vim.fn.getcwd() .. '/.nvim/' .. 'toolsPath.json')
end

local function find_config()
	if searchedForConfig then
		return cachedConfig
	end

	local tools_path = get_tools_path()
	local tools_file = io.open(tools_path, 'r')
	if not tools_file then
		print("Could not open file: " .. tools_path)
		return ".swiftlint.yml"
	end

	local tools_content = tools_file:read("*all")
	local tools_json = vim.json.decode(tools_content)

	tools_file:close()

	searchedForConfig = true

	cachedConfig = tools_json.swiftlintConfig

	return cachedConfig
end

local function find_swiftlint()
	if searchedForSwiftlint then
		return cachedSwiftlintPath
	end

	local tools_path = get_tools_path()
	-- Check if the file was found
	local tools_file = io.open(tools_path, 'r')
	if not tools_file then
		return "swiftlint"
	end

	local tools_content = tools_file:read("*all")
	local tools_json = vim.json.decode(tools_content)

	tools_file:close()

	searchedForSwiftlint = true

	cachedSwiftlintPath = tools_json.swiftlint

	return cachedSwiftlintPath
end

local function setup_swiftlint()
	local lint = require("lint")
	local pattern = "[^:]+:(%d+):(%d+): (%w+): (.+)"
	local groups = { "lnum", "col", "severity", "message" }
	local defaults = { ["source"] = "swiftlint" }
	local severity_map = {
		["error"] = vim.diagnostic.severity.ERROR,
		["warning"] = vim.diagnostic.severity.WARN,
	}

	lint.linters.swiftlint = {
		name = "swiftlint",
		cmd = find_swiftlint() or "swiftlint",
		stdin = false,
		args = {
			"lint",
			"--force-exclude",
			"--use-alternative-excluding",
			"--config",
			function()
				return find_config() or os.getenv("HOME") .. "/.config/nvim/.swiftlint.yml"
			end,
		},
		stream = "stdout",
		ignore_exitcode = true,
		parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
	}
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- setup
		setup_swiftlint()
		lint.linters_by_ft = {
			swift = { "swiftlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ml", function()
			require("lint").try_lint()
		end, { desc = "Lint file" })
	end,
}
