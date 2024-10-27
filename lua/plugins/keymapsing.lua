return {
    {
        "nvim-telescope/telescope.nvim",
        opts = function(_, opts)
            local actions = require("telescope.actions")
            opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
                mappings = {
                    i = {
                        ["<M-j>"] = actions.move_selection_next,
                        ["<M-k>"] = actions.move_selection_previous,
                    },
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.mapping = require("config.mappings").cmp.insert()
        end,
    },
}
