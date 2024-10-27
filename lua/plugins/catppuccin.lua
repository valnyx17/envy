return {
    {
        "catppuccin/nvim",
        opts = function(_, opts)
            opts.color_overrides = {
                mocha = {
                    rosewater = "#f4dbd6",
                    flamingo = "#f0c6c6",
                    pink = "#f5bde6",
                    mauve = "#c6a0f6",
                    red = "#f43841",
                    maroon = "#ff4f58",
                    peach = "#f5a97f",
                    yellow = "#ffdd33",
                    green = "#73c936",
                    teal = "#96a6c8",
                    sky = "#96a6c8",
                    sapphire = "#565f73",
                    blue = "#96a6c8",
                    lavender = "#9e95c7",
                    text = "#e4e4ef",
                    subtext1 = "#d4d4df",
                    subtext0 = "#c4c4cf",
                    overlay2 = "#52494e",
                    overlay1 = "#484848",
                    overlay0 = "#52494e",
                    surface2 = "#484848",
                    surface1 = "#453d41",
                    surface0 = "#282828",
                    base = "#181818",
                    mantle = "#101010",
                    crust = "#000000",
                },
            }
            opts.custom_highlights = function(C)
                return {
                    CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
                    CmpItemKindKeyword = { fg = C.base, bg = C.red },
                    CmpItemKindText = { fg = C.base, bg = C.teal },
                    CmpItemKindMethod = { fg = C.base, bg = C.blue },
                    CmpItemKindConstructor = { fg = C.base, bg = C.blue },
                    CmpItemKindFunction = { fg = C.base, bg = C.blue },
                    CmpItemKindFolder = { fg = C.base, bg = C.blue },
                    CmpItemKindModule = { fg = C.base, bg = C.blue },
                    CmpItemKindConstant = { fg = C.base, bg = C.peach },
                    CmpItemKindField = { fg = C.base, bg = C.green },
                    CmpItemKindProperty = { fg = C.base, bg = C.green },
                    CmpItemKindEnum = { fg = C.base, bg = C.green },
                    CmpItemKindUnit = { fg = C.base, bg = C.green },
                    CmpItemKindClass = { fg = C.base, bg = C.yellow },
                    CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
                    CmpItemKindFile = { fg = C.base, bg = C.blue },
                    CmpItemKindInterface = { fg = C.base, bg = C.yellow },
                    CmpItemKindColor = { fg = C.base, bg = C.red },
                    CmpItemKindReference = { fg = C.base, bg = C.red },
                    CmpItemKindEnumMember = { fg = C.base, bg = C.red },
                    CmpItemKindStruct = { fg = C.base, bg = C.blue },
                    CmpItemKindValue = { fg = C.base, bg = C.peach },
                    CmpItemKindEvent = { fg = C.base, bg = C.blue },
                    CmpItemKindOperator = { fg = C.base, bg = C.blue },
                    CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
                    CmpItemKindCopilot = { fg = C.base, bg = C.teal },
                }
            end
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.window = {
                completion = {
                    -- winhighlight = "Normal:PMenu,FloatBorder:PMenu",
                    col_offset = -3,
                    side_padding = 0,
                },
            }
            opts.formatting.fields = { "kind", "abbr", "menu" }
        end,
    },
}
