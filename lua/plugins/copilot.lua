return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v22.14.0/bin/node",
		suggestion = { enabled = false },
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}
