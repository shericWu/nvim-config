return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            auto_install = true,
            -- ensure_installed = {
            --     "lua",
            --     "c",
            --     "cpp",
            --     "markdown",
            --     "markdown_inline",
            --     "vim",
            --     "vimdoc",
            -- },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true
            },
        })
    end
}
