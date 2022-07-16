require("nvim-lsp-installer").setup {}
local servers = { 'tsserver', 'pyright', 'sumneko_lua', 'html', 'cssmodules_ls', 'cssls' }
Display_diagnostics = true

-- utility functions
local function togglediagnosticDisplay() -- Toggle Diagnostic Display
    if not Display_diagnostics then
        vim.diagnostic.enable()
        Display_diagnostics = true
    else
        vim.diagnostic.disable()
        Display_diagnostics = false
    end
end

local function toggleDiagnosticDisplay()
    if not pcall(togglediagnosticDisplay) then -- pcall fucnton to catch errors
        Display_diagnostics = not Display_diagnostics
    end
end

vim.diagnostic.config({
    virtual_text = false,
    underline = true
})

local function configFunc(client, bufnr)
    vim.cmd("highlight DiagnosticUnderlineHint guisp='red'")
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, bufopts) -- layout configs
    vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-sh>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>t', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<space>F', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<space>D', toggleDiagnosticDisplay, bufopts)

end


local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}


-- nvim cmp capability

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsptable = require('lspconfig')
for index, name in pairs(servers) do
    lsptable[name].setup {
        on_attach = configFunc,
        flags = lsp_flags,
        capabilities = capabilities
    }
end
