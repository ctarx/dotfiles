require("indent_blankline").setup {
  char = '┊',
  show_end_of_line = true,
}

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
