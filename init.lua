-- require('plugins')

local Plug = vim.fn['plug#']
vim.call('plug#begin','~/.vim/plugged')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = function() vim.cmd('TSUpdate') end})
Plug('jiangmiao/auto-pairs')
Plug('ervandew/supertab')
Plug('preservim/nerdtree')
-- Plug('dracula/vim', {['as']='dracula'}) 
Plug('marko-cerovac/material.nvim')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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


require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {'python','typescript','lua','vim'},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "viml" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('config_telescope')
local function reloadPackages()
    for key, _ in pairs(package.loaded) do
        package.loaded[key] = nil
    end
    vim.cmd('source $MYVIMRC')
end
vim.keymap.set('n', '<leader>lp', reloadPackages, opts)