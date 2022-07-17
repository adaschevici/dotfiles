vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require('config.utils')
local settings = require('user-conf')

local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

local buffer = { o, bo }
local window = { o, wo }

-- skip some remote provider login
g.loaded_python_provider = 0
g.python3_host_prog = '$HOME/.pyenv/versions/local/bin/python'

-- set <leader> key
g.mapleader = [[\]]
g.maplocalleader = [[\]]

-- set options for nvim
opt('textwidth', 120, buffer)
opt('scrolloff', 7)
opt('wildignore', '*.o,*~,*.pyc')
opt('wildmode', 'longest,full')
opt('lazyredraw', true)
opt('showmatch', true)
opt('ignorecase', true)
opt('smartcase', true)
opt('clipboard', 'unnamedplus')
opt('swapfile', false)
opt('history', 700)
opt('termguicolors', true)
opt('autoindent', true)
opt('showmode', true)
opt('hlsearch', true)
opt('ruler', true)
opt('list', true)
opt('listchars', settings.listchars)

-- set buffer and window options
opt('smartindent', true, buffer)
opt('expandtab', true, buffer)
opt('relativenumber', true, window)
opt('number', true, window)
opt('cursorline', true, window)
opt('cursorcolumn', true, window)

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')
