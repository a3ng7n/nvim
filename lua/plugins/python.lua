return {
  { "linux-cultist/venv-selector.nvim", enabled = true },
  -- add justMyCode keymaps and set venv for python dap
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "linux-cultist/venv-selector.nvim",
    },
    keys = {
      {
        "<leader>dPT",
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("dap-python").test_method({ config = { justMyCode = false } })
        end,
        desc = "Debug Method (justMyCode = false)",
        ft = "python",
      },
      {
        "<leader>dPC",
        function()
          ---@diagnostic disable-next-line: missing-fields
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
  {
    "lucaSartore/nvim-dap-exception-breakpoints",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local set_exception_breakpoints = require("nvim-dap-exception-breakpoints")

      vim.api.nvim_set_keymap(
        "n",
        "<leader>dE",
        "",
        { desc = "[D]ebug [C]ondition breakpoints", callback = set_exception_breakpoints }
      )
    end,
  },
  -- Python testing configuration with neotest
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          ["pytest_discover_instances"] = true,
          ["runner"] = "pytest",
        },
      },
      -- Ignore common build artifact directories when looking for tests
      discovery = {
        enabled = true,
        filter_dir = function(name)
          return not vim.tbl_contains(
            { "node_modules", ".git", "__pycache__", ".pytest_cache", "venv", ".venv", "build", "dist", ".tox" },
            name
          )
        end,
      },
    },
  },
}
