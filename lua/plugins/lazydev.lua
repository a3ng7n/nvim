return {
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "linux-cultist/venv-selector.nvim",
    },
    keys = {
      {
        "<leader>dPt",
        function()
          require("dap-python").test_method({ config = { justMyCode = false } })
        end,
        desc = "Debug Method",
        ft = "python",
      },
      {
        "<leader>dPc",
        function()
          require("dap-python").test_class({ config = { justMyCode = false } })
        end,
        desc = "Debug Class",
        ft = "python",
      },
    },
    config = function()
      require("dap-python").setup(require("venv-selector").python())
    end,
  },
}
