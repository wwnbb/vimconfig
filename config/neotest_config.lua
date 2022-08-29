require("neotest").setup({
    adapters = {
      require("neotest-python"),
      require("neotest-go")
    },
    consumers = {},
    diagnostic = {
      enabled = true
    },
    discovery = {
      enabled = true
    },
    floating = {
      border = "rounded",
      max_height = 0.7,
      max_width = 0.7,
      options = {
        winblend = 5,
        wrap = true
      }
    },
    highlights = {
      adapter_name = "NeotestAdapterName",
      border = "NeotestBorder",
      dir = "NeotestDir",
      expand_marker = "NeotestExpandMarker",
      failed = "NeotestFailed",
      file = "NeotestFile",
      focused = "NeotestFocused",
      indent = "NeotestIndent",
      marked = "NeotestMarked",
      namespace = "NeotestNamespace",
      passed = "NeotestPassed",
      running = "NeotestRunning",
      select_win = "NeotestWinSelect",
      skipped = "NeotestSkipped",
      test = "NeotestTest"
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
      skipped = "ﰸ",
      unknown = "?"
    },
    jump = {
      enabled = true
    },
    output = {
      enabled = true,
      open_on_run = true
    },
    run = {
      enabled = true
    },
    status = {
      enabled = true,
      signs = true,
      virtual_text = true
    },
    strategies = {
      integrated = {
        height = 40,
        width = 120
      }
    },
    summary = {
      enabled = true,
      expand_errors = true,
      follow = true,
      mappings = {
        attach = "a",
        clear_marked = "M",
        expand = { "<CR>", "<2-LeftMouse>" },
        expand_all = "e",
        jumpto = "i",
        mark = "m",
        output = "o",
        run = "r",
        run_marked = "R",
        short = "O",
        stop = "u"
      }
    }
  })
