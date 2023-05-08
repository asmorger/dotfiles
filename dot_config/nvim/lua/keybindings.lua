local km = vim.keymap

-- Telescope 
local builtin = require('telescope.builtin')
km.set('n', '<leader>ff', builtin.find_files, {})
km.set('n', '<leader>fg', builtin.live_grep, {})
km.set('n', '<leader>fb', builtin.buffers, {})
km.set('n', '<leader>fh', builtin.help_tags, {})

-- LazyGit
local lazyGit = require('lazygit')
km.set('n', '<leader>gg', lazyGit.lazygitcurrentfile, {})

-- nvim-tree

local tree = require('nvim-tree.actions.tree.toggle')
km.set('n', '<leader>tt', tree.fn, {})

-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})
