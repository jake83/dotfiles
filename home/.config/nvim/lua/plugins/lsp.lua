return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      -- show the parameter popup automatically while typing a call
      signature = { enabled = true },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.enable('intelephense') -- php
      -- typescript + javascript: typescript 7 ships a native LSP server,
      -- reachable through the global tsc wrapper (there is no separate tsgo bin)
      vim.lsp.config('tsgo', { cmd = { 'tsc', '--lsp', '--stdio' } })
      vim.lsp.enable('tsgo')
      vim.lsp.enable('pyright') -- python
    end,
  },
}
