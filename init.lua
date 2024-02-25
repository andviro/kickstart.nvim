-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info

-- Set ; as the leader key
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

require 'core.options'
require 'core.lazy'
require 'core.autocommands'
require 'core.mappings'

-- vim: ts=2 sts=2 sw=2 et
