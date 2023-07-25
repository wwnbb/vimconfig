-- Install Packer if it's not already installed
require 'core.packer'
require 'core.lsp'
require 'highlights'
require 'keymappings'
require 'misc'

require 'plugins_conf'

for _, f in ipairs(vim.fn.globpath('~/.config/nvim/vim_config/', '*', false, true)) do
  vim.cmd('source ' .. f)
end
