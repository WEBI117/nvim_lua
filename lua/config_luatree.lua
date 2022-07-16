-- For more config options -> https://github.com/kyazdani42/nvim-tree.lua/blob/master/lua/nvim-tree.lua
require("nvim-tree").setup({
    view={
        adaptive_size=true,
        side="left",
    },
    renderer={
        indent_markers={
            enable=true,
            icons={
                item="├ ",
            },
        },
    },
    filters={
        dotfiles=true,
    },
})
vim.keymap.set('n', '<F3>', function() vim.cmd('NvimTreeToggle') end, opts)
vim.keymap.set('n', '<F4>', function() vim.cmd('NvimTreeRefresh') end, opts)



