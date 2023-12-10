vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- Highlight Yank
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='ErrorMsg', timeout=300 }
  augroup END
]])
