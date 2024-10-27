-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmds = {}

-- a function to create a function that creates autocmds for an augroup
function autocmds.create_wrapper(augroup_name)
    local augroup = vim.api.nvim_create_augroup(augroup_name, { clear = true })
    return function(event, opts)
        opts.group = opts.group or augroup
        return vim.api.nvim_create_autocmd(event, opts)
    end,
        augroup
end

autocmds.create, autocmds.augroup = autocmds.create_wrapper("waves")

autocmds.create({ "FileType" }, {
    pattern = { "json", "jsonc" },
    callback = function()
        vim.wo.conceallevel = 0
    end,
})
