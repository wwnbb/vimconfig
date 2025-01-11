-- Auto loading lsp servers for mason
local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()

--- Generates the LSP client capabilities
--- @return table
local function default_capabilities()
	-- Client capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	--- Setup capabilities to support utf-16, since copilot.lua only works with utf-16
	--- this is a workaround to the limitations of copilot language server
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		offsetEncoding = { "utf-16" },
		general = {
			positionEncodings = { "utf-16" },
		},
	})

	return capabilities
end

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
	function(server_name)
		local server = lspconfig[server_name]
		-- Attempt to load the server's configuration
		local server_path = "core.lsp.configs." .. server_name
		local success, config = pcall(require, server_path)
		-- If the configuration doesn't exist, use an empty table
		if not success then
			config = {}
		end

		config.capabilities = config.capabilities or default_capabilities()
		server.setup(config)
	end,
})

-- AutoDiagnostic on Hover
-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(winid).zindex then
			return
		end
	end
	-- THIS IS FOR BUILTIN LSP
	vim.diagnostic.open_float(0, {
		scope = "cursor",
		focusable = false,
		close_events = {
			"CursorMoved",
			"CursorMovedI",
			"BufHidden",
			"InsertCharPre",
			"WinLeave",
		},
	})
end

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	command = "lua OpenDiagnosticIfNoFloat()",
	group = "lsp_diagnostics_hold",
})
