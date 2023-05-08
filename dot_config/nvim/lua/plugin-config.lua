vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_floating_window_scaling_factor = 0.9

local circles = require('circles')
circles.setup({ icons = { empty = '', filled = '', lsp_prefix = '' } })

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
   group_empty = true,
    icons = {
      glyphs = circles.get_nvimtree_glyphs(),
    }
  },
  filters = {
    dotfiles = true,
  },
})

require('neorg').setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                }
            }
        }
    }
})
 
