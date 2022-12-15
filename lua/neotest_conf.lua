local Path = require("plenary.path")

require("neotest").setup({
    adapters = {
      require("neotest-go"),
      require("neotest-python")({
          runner = "pytest",

          python = ".venv/bin/python",

          dap = { justMyCode = false },

          is_test_file = function(file_path)
            if not vim.endswith(file_path, ".py") then
              return false
            end
            local elems = vim.split(file_path, Path.path.sep)
            local file_name = elems[#elems]
            return vim.startswith(file_name, "test_")
            or vim.endswith(file_name, "_test.py")
            or vim.endswith(file_name, "Test.py")
          end
        }),
    },
    icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "╮",
      failed = "✖",
      final_child_indent = " ",
      final_child_prefix = "╰",
      non_collapsible = "─",
      passed = "✔",
      running = "🗘",
      skipped = "☇",
      unknown = "?"
    },
  })
