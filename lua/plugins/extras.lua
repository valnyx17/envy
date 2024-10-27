return {
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.cmake" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.gleam" },
    { import = "lazyvim.plugins.extras.lang.go" },
    --{ import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.coding.copilot-chat" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "ys",
                delete = "ds",
                replace = "cs",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = { mason = false },
            },
        },
    },
    { import = "lazyvim.plugins.extras.util.octo" },
    -- { import = "lazyvim.plugins.extras.util.gitui" },
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.lsp.neoconf" },
    { import = "lazyvim.plugins.extras.lang.astro" },
    { import = "lazyvim.plugins.extras.editor.dial" },
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.editor.outline" },
    { import = "lazyvim.plugins.extras.editor.overseer" },
    { import = "lazyvim.plugins.extras.editor.refactoring" },
    { import = "lazyvim.plugins.extras.editor.telescope" },
    { import = "lazyvim.plugins.extras.coding.luasnip" },
    { import = "lazyvim.plugins.extras.coding.neogen" },
    { import = "lazyvim.plugins.extras.dap.core" },
}