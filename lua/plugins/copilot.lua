-- Copilot.
return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            -- I don't find the panel useful.
            panel = { enabled = false },
            suggestion = {
                auto_trigger = true,
                -- hide_during_completion = false,
                -- Use alt to interact with Copilot.
                keymap = {
                    accept = "<M-A>",
                    accept_word = "<M-w>",
                    accept_line = "<M-l>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-_>",
                },
            },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
        config = function(_, opts)
            local cmp = require("cmp")
            local copilot = require("copilot.suggestion")
            local luasnip = require("luasnip")

            require("copilot").setup(opts)

            local function set_trigger(trigger)
                vim.b.copilot_suggestion_auto_trigger = trigger
                vim.b.copilot_suggestion_hidden = not trigger
            end

            -- Hide suggestions when the completion menu is open.
            cmp.event:on("menu_opened", function()
                if copilot.is_visible() then
                    copilot.dismiss()
                end
                set_trigger(false)
            end)

            -- Disable suggestions when inside a snippet.
            cmp.event:on("menu_closed", function()
                set_trigger(not luasnip.expand_or_locally_jumpable())
            end)
            vim.api.nvim_create_autocmd("User", {
                pattern = { "LuasnipInsertNodeEnter", "LuasnipInsertNodeLeave" },
                callback = function()
                    set_trigger(not luasnip.expand_or_locally_jumpable())
                end,
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        optional = true,
        event = "VeryLazy",
        opts = function(_, opts)
            local colors = {
                [""] = LazyVim.ui.fg("Special"),
                ["Normal"] = LazyVim.ui.fg("Special"),
                ["Warning"] = LazyVim.ui.fg("DiagnosticError"),
                ["InProgress"] = LazyVim.ui.fg("DiagnosticWarn"),
            }
            table.insert(opts.sections.lualine_x, 2, {
                function()
                    local icon = LazyVim.config.icons.kinds.Copilot
                    local status = require("copilot.api").status.data
                    return icon .. (status.message or "")
                end,
                cond = function()
                    if not package.loaded["copilot"] then
                        return
                    end
                    local ok, clients = pcall(LazyVim.lsp.get_clients, { name = "copilot", bufnr = 0 })
                    if not ok then
                        return false
                    end
                    return ok and #clients > 0
                end,
                color = function()
                    if not package.loaded["copilot"] then
                        return
                    end
                    local status = require("copilot.api").status.data
                    return colors[status.status] or colors[""]
                end,
            })
        end,
    },
}
