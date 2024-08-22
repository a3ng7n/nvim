return {
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "linux-cultist/venv-selector.nvim",
    },
    keys = {
      {
        "<leader>dPT",
        function()
          require("dap-python").test_method({ config = { justMyCode = false } })
        end,
        desc = "Debug Method (justMyCode = false)",
        ft = "python",
      },
      {
        "<leader>dPC",
        function()
          require("dap-python").test_class({ config = { justMyCode = false } })
        end,
        desc = "Debug Class (justMyCode = false)",
        ft = "python",
      },
    },
    config = function()
      require("dap-python").setup(require("venv-selector").python())
    end,
  },
  -- tell ruff to sort imports on save
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_format", "ruff_fix" },
      },
    },
  },
  -- multiple cursors
  { "mg979/vim-visual-multi" },
  -- tailwind class name hints
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- opts = {}, -- your configuration
  },
}
