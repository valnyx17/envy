local M = {}

-- inspired by pynappo's keymaps file!
-- https://github.com/pynappo/dotfiles/blob/44fae21f47aa8c28d78deef3e1d4c59571f16bdb/.config/nvim/lua/pynappo/keymaps/init.lua
M.setup = {
    regular = require("config.mappings.regular").setup,
    compile = require("config.mappings.compile").setup,
    snipe = require("config.mappings.snipe").setup,
}

M.cmp = require("config.mappings.cmp")

return M
