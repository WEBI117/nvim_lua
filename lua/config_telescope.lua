-- defaults
require('telescope').setup{
    pickers = {
        current_buffer_fuzzy_find = {
            previewer = false
        }
    }
}

-- functions
local function gitfunc(func)
    local pipe = io.popen('git rev-parse --git-dir 2>/dev/null')
    local output = pipe:read("*a")
    if(#output > 0)  
    then
        vim.inspect(require('telescope.builtin')[func](require('telescope.themes').get_dropdown({})))
    else
        print('Root directory is not a git repository.')
    end
end 

-- keymappings
vim.keymap.set('n', '<Leader>ff', function() require('telescope.builtin').find_files() end, {})
vim.keymap.set('n', '<Leader>fi', function() require('telescope.builtin').current_buffer_fuzzy_find() end, {})
vim.keymap.set('n', '<Leader>fb', function() require('telescope.builtin').buffers() end, {})

-- commands
vim.api.nvim_create_user_command(
    "Gs",
    function()
        gitfunc('git_status')
    end,
    {bang = true, desc = 'Get git status'}
)

vim.api.nvim_create_user_command(
    "Gh",
    function()
        gitfunc('git_stash')
    end,
    {bang = true, desc = 'Get git status'}
)

vim.api.nvim_create_user_command(
    "Gb",
    function()
        gitfunc('git_branches')
    end,
    {bang = true, desc = 'Get git status'}
)
