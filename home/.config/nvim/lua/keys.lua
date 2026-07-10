-- save by pressing Escape
vim.keymap.set('n', '<Esc>', ':w<CR>', { desc = 'Save' })
-- select all
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select All' })
-- pasting over a selection no longer clobbers your clipboard
vim.cmd([[ xnoremap <expr> p 'pgv"'.v:register.'y' ]])
-- ctrl+click jumps to the definition under the mouse (LSP), ctrl+right-click jumps back
-- (terminals cannot report cmd+click, so ctrl is the modifier that works everywhere)
vim.keymap.set('n', '<C-LeftMouse>', '<LeftMouse><Cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
vim.keymap.set('n', '<C-RightMouse>', '<C-o>', { desc = 'Jump back' })
-- toggle inlay hints (inline parameter names and inferred types)
vim.keymap.set('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = 'Toggle inlay hints' })
