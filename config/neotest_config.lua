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
      max_height = 0.6,
      max_width = 0.6,
      options = {}
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

vim.cmd([[ 
   hi default NeotestPassed ctermfg=Green guifg=#96F291 
   hi default NeotestFailed ctermfg=Red guifg=#F70067 
   hi default NeotestRunning ctermfg=Blue guifg=##2709D2
   hi default NeotestSkipped ctermfg=Cyan guifg=#00f1f5 
   hi default link NeotestTest Normal
   hi default NeotestNamespace ctermfg=Magenta guifg=#D484FF 
   hi default NeotestFocused gui=bold,underline cterm=bold,underline 
   hi default NeotestFile ctermfg=Cyan guifg=#00f1f5 
   hi default NeotestDir ctermfg=Cyan guifg=#00f1f5 
   hi default NeotestIndent ctermfg=Grey guifg=#8B8B8B 
   hi default NeotestExpandMarker ctermfg=Grey guifg=#8094b4 
   hi default NeotestAdapterName ctermfg=Red guifg=#F70067 
   hi default NeotestWinSelect ctermfg=Cyan guifg=#00f1f5 gui=bold 
   hi default NeotestMarked ctermfg=Brown guifg=#F79000 gui=bold 
   hi default NeotestTarget ctermfg=Red guifg=#F70067 
   hi default link NeotestUnknown Normal 
 ]])
