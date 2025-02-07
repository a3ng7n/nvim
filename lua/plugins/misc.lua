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
    keys = {
      {
        "<leader>NN",
        function()
          require("neogen").generate()
        end,
        desc = "Annotate",
      },
      {
        "<leader>Nf",
        function()
          require("neogen").generate({ type = "func" })
        end,
        desc = "Annotate function",
      },
      {
        "<leader>Nc",
        function()
          require("neogen").generate({ type = "class" })
        end,
        desc = "Annotate class",
      },
      {
        "<leader>Nt",
        function()
          require("neogen").generate({ type = "type" })
        end,
        desc = "Annotate type",
      },
      {
        "<leader>NF",
        function()
          require("neogen").generate({ type = "file" })
        end,
        desc = "Annotate file",
      },
    },
    languages = {
      typescript = { template = { annotation_convention = "tsdoc" } },
      typescriptreact = { template = { annotation_convention = "tsdoc" } },
    },
  },
}
