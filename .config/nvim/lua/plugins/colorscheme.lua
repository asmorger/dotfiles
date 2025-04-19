return {
  -- add miramare
  { "franbach/miramare" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "miramare",
    },
  },
}
