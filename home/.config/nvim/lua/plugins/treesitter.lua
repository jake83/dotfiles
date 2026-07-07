return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "php", "lua", "vim", "vimdoc", "javascript", "typescript", "vue", "json", "yaml", "markdown"
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "php", "lua", "vim", "javascript", "typescript", "vue", "json", "yaml", "markdown" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
