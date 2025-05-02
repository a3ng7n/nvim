return {
  -- tailwind class name hints
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },
  -- chrome debugger setup
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["pwa-chrome"] then
        dap.adapters["pwa-chrome"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              LazyVim.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
              "${port}",
            },
          },
        }
      end
      for _, lang in ipairs({
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
      }) do
        dap.configurations[lang] = dap.configurations[lang] or {}
        table.insert(dap.configurations[lang], {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch in Chrome",
          url = "https://localhost:3000",
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
          protocol = "inspector",
          sourceMaps = true,
          webRoot = vim.fn.getcwd() .. "/front",
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
        })
      end
    end,
  },
  -- vtsls customization
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { vtsls = { settings = { typescript = { preferences = { importModuleSpecifier = "shortest" } } } } },
    },
  },
  -- fuck the typescript language server, all my homies hate microsoft
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- REMOVE THIS once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            find = "Request textDocument/inlayHint failed",
          },
          opts = { skip = true },
        },
      },
    },
  },
}
