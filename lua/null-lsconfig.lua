null_ls = require("null-ls")


null_ls.setup({
    sources = {
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black
    },
  })
