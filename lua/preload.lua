vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require 'config.utils'
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

g.mapleader = [[ ]]
local buffer = { o, bo }
local window = { o, wo }
opt('textwidth', 120, buffer)
