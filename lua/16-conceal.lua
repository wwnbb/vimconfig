vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
  group = group,
  pattern = { "*.tsx"},
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()

    local conceal_ns = vim.api.nvim_create_namespace "class_conceal"

    ---Conceal HTML class attributes. Ideal for big TailwindCSS class lists
    ---Ref: https://gist.github.com/mactep/430449fd4f6365474bfa15df5c02d27b
    local language_tree = vim.treesitter.get_parser(bufnr, "tsx")
    local syntax_tree = language_tree:parse()
    local root = syntax_tree[1]:root()

    local query = vim.treesitter.query.parse(
      "tsx",
      [[
        ((jsx_attribute
          (property_identifier) @attribute-name
          (string (string_fragment) @attribute-value))
          (#eq? @attribute-name "className")
          (#set! @attribute-value conceal "…"))
      ]]
    )

    for _, captures, metadata in query:iter_matches(root, bufnr, root:start(), root:end_()) do
      local start_row, start_col, end_row, end_col = captures[2]:range()
      vim.api.nvim_buf_set_extmark(bufnr, conceal_ns, start_row, start_col, {
        end_line = end_row,
        end_col = end_col,
        conceal = metadata[2].conceal,
      })
    end
  end,
})
