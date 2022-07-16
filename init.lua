local Plug = vim.fn['plug#']
vim.call('plug#begin','~/.vim/plugged')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = function() vim.cmd('TSUpdate') end})
Plug ('kyazdani42/nvim-tree.lua')
Plug('alvarosevilla95/luatab.nvim')
Plug('jiangmiao/auto-pairs')
Plug('marko-cerovac/material.nvim')
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')
Plug ('neovim/nvim-lspconfig') -- Configurations for Nvim LSP
Plug ('nvim-lualine/lualine.nvim')
Plug ('kyazdani42/nvim-web-devicons')
Plug ("williamboman/nvim-lsp-installer")
Plug ("neovim/nvim-lspconfig")
Plug ('hrsh7th/cmp-nvim-lsp')
Plug ('hrsh7th/cmp-buffer')
Plug ('hrsh7th/cmp-path')
Plug ('hrsh7th/cmp-cmdline')
Plug ('hrsh7th/nvim-cmp')
Plug ('kyazdani42/nvim-web-devicons' )-- for file icons
Plug ('maxmellon/vim-jsx-pretty')
-- old plugs
-- Plug('ervandew/supertab')
-- Plug('dracula/vim', {['as']='dracula'}) 
-- Plug('scrooloose/nerdtree')
-- Plug('preservim/nerdtree')
vim.call('plug#end')

opts = {noremap=true,silent=true}
nosilentopts = {noremap=true}

vim.g.mapleader = ','
-- Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "n"
vim.opt.numberwidth = 2
vim.opt.laststatus = 3
-- color
vim.cmd 'colorscheme material'
vim.g.background = 'dark'
vim.g.material_style = 'oceanic'
-- Key Mappings.
vim.keymap.set('n', '<Leader>sr', ':source $MYVIMRC<CR>', nosilentopts)
vim.keymap.set('n', '<Leader>er', ':e $MYVIMRC<CR>', opts)
vim.keymap.set('n', '<Leader><Space>', ':nohl<CR>', opts)
vim.keymap.set('n', '<Right>', ':tabnext<CR>', opts)
vim.keymap.set('n', '<Left>', ':tabprev<CR>', opts)
vim.keymap.set('n', '<Leader>tt', ':tabnew<CR>', opts)
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>', opts)
vim.keymap.set('n', '<Leader>w', ':w<CR>', nosilentopts)
-- splits
vim.keymap.set('n', '<Leader>sv', '<C-w>v', opts)
vim.keymap.set('n', '<Leader>ss', '<C-w>s', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
-- folds
vim.keymap.set('v', '<Leader>f', ':fold<CR>', opts)
-- visual indent
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)
-- clipboard
vim.keymap.set('v', '<Leader>y', '"*y', opts)
vim.keymap.set('v', '<Leader>p', '"*p', opts)
vim.keymap.set('n', '<Leader>p', '"*p', opts)
-- 
vim.keymap.set('n', '<F1>', '<Nop>' ,opts)

-- modules
require('config_treesitter')
require('config_telescope')
require('config_nvimlsp')
require('config_luatree')
require('config_luatab')
require('config_lualine')
require('config_nvimcmp')


-- functions

local function reloadPackages()
    for key, _ in pairs(package.loaded) do
        package.loaded[key] = nil
    end
    vim.cmd('source $MYVIMRC')
end
vim.keymap.set('n', '<leader>lp', reloadPackages, opts)
