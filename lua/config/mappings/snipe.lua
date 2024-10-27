local map = require("config.mappings.util").map
local M = {}

function M.setup()
    map({
        [{ "n" }] = {
            {
                "<S-l>",
                function()
                    local toggle = require("snipe").create_buffer_menu_toggler({
                        -- limit the width of path buffer names
                        max_pane_width = 1,
                    })
                    toggle()
                end,
                { desc = "Snipe" },
            },
        },
    }, {})
end

return M
