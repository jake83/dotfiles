return {
  {
    'folke/which-key.nvim',
    lazy = false,
    config = true, -- popup that shows what my leader keys do
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        variant = 'moon',
        palette = {
          -- Junie's dark greys, matching wezterm's background.
          moon = {
            base = '#191A1C',
            surface = '#141516',
            overlay = '#3A3A3A',
          },
        },
      })
      vim.cmd.colorscheme('rose-pine')
    end,
  },
}
