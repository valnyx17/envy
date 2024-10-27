local map = require("config.mappings.util").map
local fish_style_abbr = require("config.mappings.util").fish_style_abbr
local M = {}

function M.setup()
    local autoindent = function(key)
        return function()
            return not vim.api.nvim_get_current_line():match("%g") and "cc" or key
        end
    end
    local noresilent = { noremap = true, silent = true }
    map({
        [{ "n" }] = {
            -- { ";",          ":",                                                            { desc = "CMD enter command mode" } },
            -- autoindent on insert/append
            { "I", autoindent("I"), { expr = true } },
            { "i", autoindent("i"), { expr = true } },
            { "A", autoindent("A"), { expr = true } },
            { "a", autoindent("a"), { expr = true } },
            { "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>", { desc = "navigate left" } },
            { "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>", { desc = "navigate down" } },
            { "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>", { desc = "navigate up" } },
            { "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", { desc = "navigate right" } },
            { "x", '"_dl' },
            { "X", '"_dh' },
            { "<C-d>", "<C-d>zz", noresilent },
            { "<C-u>", "<C-u>zz", noresilent },
            { "YY", "va{Vy", noresilent },
            { "n", "nzz", noresilent },
            { "N", "Nzz", noresilent },
            { "*", "*zz", noresilent },
            { "#", "#zz", noresilent },
            { "g*", "g*zz", noresilent },
            { "g#", "g#zz", noresilent },
            { "<C-M-h>", ":vert resize +2<CR>", noresilent },
            { "<C-M-j>", ":resize -2<CR>", noresilent },
            { "<C-M-k>", ":resize +2<CR>", noresilent },
            { "<C-M-l>", ":vert resize -2<CR>", noresilent },
            { "<leader>fe", "<cmd>Oil<cr>", { desc = "Open Oil" } },
            {
                "<leader>fd",
                function()
                    require("oil").open(vim.fn.getcwd())
                end,
                { desc = "Open Oil in CWD" },
            },
        },
        [{ "n", "t" }] = {
            -- better tabs
            -- { "<leader>n", "<cmd>tabnew<CR>", { noremap = true, desc = "new tab" } },
            -- tab and shift tab go back and forward buffers?? in nvchad
            { "<leader><Tab>n", "<cmd>tabnext<CR>", { noremap = true, desc = "next tab" } },
            { "<leader><Tab>p", "<cmd>tabprevious<CR>", { noremap = true, desc = "previous tab" } },
            -- { "<localleader>c", "<cmd>tabclose<CR>", { noremap = true, desc = "close tab" } },
            { "<leader><Tab>1", "1gt", { desc = "switch to tab 1" } },
            { "<leader><Tab>2", "2gt", { desc = "switch to tab 2" } },
            { "<leader><Tab>3", "3gt", { desc = "switch to tab 3" } },
            { "<leader><Tab>4", "4gt", { desc = "switch to tab 4" } },
            { "<leader><Tab>5", "5gt", { desc = "switch to tab 5" } },
            { "<leader><Tab>6", "6gt", { desc = "switch to tab 6" } },
            { "<leader><Tab>7", "7gt", { desc = "switch to tab 7" } },
            { "<leader><Tab>8", "8gt", { desc = "switch to tab 8" } },
            { "<leader><Tab>9", "9gt", { desc = "switch to tab 9" } },
            { "<leader><Tab>0", "10gt", { desc = "switch to tab 10" } },
        },
        [{ "n", "v" }] = {
            { "p", "p=`]", { remap = true } },
            { "P", "P=`]", { remap = true } },
            -- { "<localleader>v", '"+p', { desc = "p (clipboard)" } },
            -- { "<localleader>V", '"+P', { desc = "P (clipboard)" } },
            -- { "<localleader>y", '"+y', { desc = "y (clipboard)" } },
            -- { "<leader>%", "<Cmd>%y<CR>", { desc = "yank file" } },
            -- { "<localleader>Y", '"+Y', { desc = "Y (clipboard)" } },
            -- { "<LeftRelease>", '"*ygv' }, -- on left mouse button release
            -- { "<C-X>", '"+d' },
            -- { "<C-V>", '"+p' },
            -- { "<C-C>", '"+y' },
        },
        [{ "ca" }] = {
            fish_style_abbr("L", "Lazy"),
            fish_style_abbr("V", "vert"),
            fish_style_abbr("VS", "vert sb"),
            fish_style_abbr("s", "s/g<Left><Left>"),
            -- fish_style_abbr("h", "vert h"),
            fish_style_abbr("w", function()
                local auto_p = "w ++p"
                if vim.env.USER == "root" then
                    return auto_p
                end
                local prefixes = { "/etc" }
                for _, prefix in ipairs(prefixes) do
                    if vim.startswith(vim.api.nvim_buf_get_name(0), prefix) then
                        return "SudaWrite"
                    end
                end
                if vim.bo.filetype == "oil" then
                    return "w"
                end
                return auto_p
            end),
            fish_style_abbr("!", "term"),
            fish_style_abbr("=", "term"),
        },
        [{ "v" }] = {
            {
                "J",
                ":m '>+1<CR>gv=gv",
                noresilent,
            },
            {
                "K",
                ":m '<-2<CR>gv=gv",
                noresilent,
            },
            { "<", "<gv" },
            { ">", ">gv" },
            { "p", '"_dp' },
            { "P", '"_dP' },
            { "x", '"_x' },
            { "X", '"_X' },
        },
        [{ "i" }] = {
            -- {
            -- '<Esc>',
            -- function()
            --   local col = vim.api.nvim_win_get_cursor(0)[2]
            --   return (col < 2) and 'l<esc>' or '<esc>'
            -- end,
            --   { expr = true },
            -- },
            { "<C-Return>", "<Esc>o" },
            { "<C-S-Return>", "<Esc>O" },
            { "<C-_>", "<Esc>:normal gcc<cr>A", noresilent },
        },
        [{ "n", "x", "o" }] = {
            { "H", "^", noresilent },
            { "L", "g_", noresilent },
        },
    }, { silent = true })
end

return M
