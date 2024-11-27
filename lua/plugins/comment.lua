return {
  {
    "numToStr/Comment.nvim",
    config = { enable_autocmd = false },
  },
  {
    "danymat/neogen",
    opts = {
      snippet_engine = "luasnip",
      placeholders_text = {
        ["description"] = "description",
        ["tparam"] = "tparam",
        ["parameter"] = "parameter",
        ["return"] = "return",
        ["class"] = "class",
        ["throw"] = "throw",
        ["varargs"] = "varargs",
        ["type"] = "type",
        ["attribute"] = "attribute",
        ["args"] = "args",
        ["kwargs"] = "kwargs",
      },
    },
    keys = {
      {
        "gcg",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Annotations (Neogen)",
      },
    },
  },
}
