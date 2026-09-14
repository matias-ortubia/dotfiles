vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.number = true
vim.opt.foldcolumn = "0"
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.foldmethod = "manual"
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
