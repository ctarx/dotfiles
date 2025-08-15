-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

-- Indent wrapped lines to match the start of the line
vim.opt.breakindent = true

-- Show whitespace characters in a more readable way
vim.opt.listchars = {
  tab = "» ", -- show tabs as » followed by a space
  trail = "·", -- show trailing spaces as ·
  nbsp = "␣", -- show non-breaking spaces as ␣
}

-- Custom cursor style per mode
vim.opt.guicursor = {
  "n:block-blinkon500-blinkoff500", -- Normal mode: block cursor, blinks every 500ms
  "i-ci:ver25", -- Insert & command-line mode: vertical bar cursor (25% width)
}
