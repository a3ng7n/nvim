return {
  { "linux-cultist/venv-selector.nvim", enabled = true },
  -- add justMyCode keymaps and set venv for python dap
  {
    "a3ng7n/nvim-dap-python",
    branch = "fix-add-root-dirs-default-runner",
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
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          --     -- ["runner"] = "pytest",
          ["python"] = require("dap-python").setup(require("venv-selector").python()),
          --     is_test_file = function(file_path)
          --       if not vim.endswith(file_path, ".py") then
          --         return false
          --       end
          --       local elems = vim.split(file_path, Path.path.sep)
          --       local file_name = elems[#elems]
          --       local result = not (string.find(file_path, "circuit_executor") or string.find(file_path, "sim_executor"))
          --       result = result and (vim.startswith(file_name, "test_") or vim.endswith(file_name, "_test.py"))
          --       return result
          --     end,
          --     -- ["pytest_discover_instances"] = true,
        },
      },
      ["discovery"] = {
        ["filter_dir"] = function(file_name, rel_path, root_path)
          local result = not (string.find(rel_path, "circuit_executor") or string.find(rel_path, "sim_executor"))
          return result
        end,
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
}
