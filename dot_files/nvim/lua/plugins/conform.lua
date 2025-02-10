return {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          cpp = { "clang-format" },
        },
    }
    return opts
  end,
} 
