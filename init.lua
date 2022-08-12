local vim_cmd = vim.cmd


vim_cmd 'source $HOME/.config/nvim/vimscripts/base.nvim'


require('plugins')

-- lua defined base settings
require('base_settings')

-- lua define autocmds
require('autocmds')

-- require'nvim-tree'.setup{}
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.rust_analyzer.setup{}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- enable filetypee.lua
-- This feature is currently opt-in
-- as it does not yet completely match all of the filetypes covered by filetype.vim
vim.g.do_filetype_lua = 1
-- disable filetype.vim
vim.g.did_load_filetypes = 0
