return {
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
    },
  },
  -- multiple cursors
  { "mg979/vim-visual-multi" },
  -- annotation generator
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
}
