print('hello from plugins')
local Plug = vim.fn['plug#']
vim.call('plug#begin','~/.vim/plugged')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
vim.call('plug#end')
