return {
    "leath-dub/snipe.nvim",
    config = function()
        local snipe = require("snipe")
        snipe.setup({
            hints = {
                dictionary = "asfghl;wertyuiop",
            },
            navigate = {
                cancel_snipe = "q",
                close_buffer = "d",
            },
            sort = "default",
        })
        require("config.mappings").setup.snipe()
    end,
}
