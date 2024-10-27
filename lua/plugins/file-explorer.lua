return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = false,
    },
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            columns = {
                "permissions",
                "size",
                "mtime",
            },
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["/"] = {
                    callback = function()
                        require("telescope.builtin").find_files()
                    end,
                    desc = "Find a file",
                    mode = "n",
                },
                ["<C-v>"] = {
                    "actions.select",
                    opts = { vertical = true },
                    desc = "Open the entry in a vertical split",
                },
                ["<C-s>"] = {
                    "actions.select",
                    opts = { horizontal = true, vertical = false },
                    desc = "Open the entry in a horizontal split",
                },
                ["<C-r>"] = "actions.refresh",
                ["<C-h>"] = false,
                ["<C-l>"] = false,
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
}
