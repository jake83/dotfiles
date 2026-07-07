return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("intelephense")
    end,
  },
}
