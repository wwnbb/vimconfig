-- Install Packer if it's not already installed
local vim = vim
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd guihua.lua]]

-- Get the directory containing the init.lua file
local config_dir = vim.fn.expand("~/.config/nvim")

-- Load all Lua files in the config directory
local function load_lua_files()
  local lua_files = vim.fn.globpath(config_dir, "lua/*.lua", false, true)
  for _, file in ipairs(lua_files) do
    if file ~= vim.fn.expand("<sfile>") then
      require(string.gsub(string.gsub(file, ".lua", ""), config_dir .. "/", ""))
    end
  end
end

-- Load the Lua files
load_lua_files()

for _, f in ipairs(vim.fn.globpath('~/.config/nvim/config/', '*', false, true)) do
  vim.cmd('source ' .. f)
end
