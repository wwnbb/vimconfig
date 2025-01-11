-- Install Packer if it's not already installed

require("core.lazy")
require("plugins_conf")
require("core.lsp")
require("misc")

require("keymappings")

for _, f in ipairs(vim.fn.globpath("~/.config/nvim/vim_config/", "*", false, true)) do
	vim.cmd("source " .. f)
end

require("highlights")
