-- Install Packer if it's not already installed
vim.deprecate = function() end

require("core.lazy")
require("plugins_conf")
require("core.lsp")
require("misc")

require("keymappings")

for _, f in ipairs(vim.fn.globpath("~/.config/nvim/vim_config/", "*", false, true)) do
	vim.cmd("source " .. f)
end

require("highlights")

vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
	group = vim.api.nvim_create_augroup("fuck_shada_temp", { clear = true }),
	pattern = { "*" },
	callback = function()
		local status = 0
		for _, f in ipairs(vim.fn.globpath(vim.fn.stdpath("data") .. "/shada", "*tmp*", false, true)) do
			if vim.tbl_isempty(vim.fn.readfile(f)) then
				status = status + vim.fn.delete(f)
			end
		end
		if status ~= 0 then
			vim.notify("Could not delete empty temporary ShaDa files.", vim.log.levels.ERROR)
			vim.fn.getchar()
		end
	end,
	desc = "Delete empty temp ShaDa files",
})

-- require("langmapper").automapping({ global = true, buffer = true })
