return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufEnter",
    cmd = "TSJToggle",
    config = function()
        require("treesj").setup({ use_default_keymaps = false })
        vim.keymap.set("n", "gJ", vim.cmd.TSJToggle, { desc = "Split/join line" })
    end,
}
