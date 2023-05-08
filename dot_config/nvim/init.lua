vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('source ~/.config/nvim/old.vim')

require("options")
require("plugins")
require("plugin-config")
require("autocommands")
require("keybindings")
