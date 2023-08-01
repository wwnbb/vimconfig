-- Install Packer if it's not already installed
require 'core.packer'
require 'plugins_conf'
require 'core.lsp'
require 'highlights'
require 'misc'


require 'keymappings'

for _, f in ipairs(vim.fn.globpath('~/.config/nvim/vim_config/', '*', false, true)) do
  vim.cmd('source ' .. f)
end
