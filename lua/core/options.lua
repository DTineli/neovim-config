vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

-- liga o erros na linha, nao sei pq no linux tava desligado
vim.diagnostic.config { virtual_text = true }

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true
vim.o.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
vim.o.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
vim.o.expandtab = true -- Convert tabs to spaces (default: false)
vim.o.showmode = false
vim.o.colorcolumn = '80'
