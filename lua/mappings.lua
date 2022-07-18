local map = vim.keymap.set
local default_options = { silent = true }
local expr_options = { expr = true, silent = true }

map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)
