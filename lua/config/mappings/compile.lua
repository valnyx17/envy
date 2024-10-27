local map = require("config.mappings.util").map
local M = {}

function M.setup()
    map({
        [{ "n" }] = {
            { "<localleader>c", ":Compile ", { desc = "Compile" } },
            { "<localleader>r", ":Recompile<cr>", { desc = "Redo last compile command", silent = true } },
        },
    }, {})
end

return M
