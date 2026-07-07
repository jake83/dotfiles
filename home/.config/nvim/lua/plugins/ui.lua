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
        styles = {
          transparency = true, -- let wezterm's opacity/blur show through
        },
      })
      vim.cmd.colorscheme('rose-pine')
    end,
  },
}
