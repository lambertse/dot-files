return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Use system clangd
      lspconfig.clangd.setup({
        cmd = { "clangd" }, -- Ensure this is the system-installed clangd
      })

      -- Use system rust-analyzer
      lspconfig.rust_analyzer.setup({
        cmd = { "rust-analyzer" }, -- Ensure this is the system-installed rust-analyzer
      })
    end,
  },
}

