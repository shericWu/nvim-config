return {
    "m4xshen/autoclose.nvim",

    config = function()
        require("autoclose").setup({
            keys = {
                ["$"] = {
                    close = true,
                    escape = false,
                    pair = "$$",
                    disabled_filetypes = {},
                    enabled_filetypes = {
                        "markdown",
                    },
                    disable_command_mode = true,
                },
                ["`"] = {
                    close = true,
                    escape = false,
                    pair = "``",
                    disabled_filetypes = {},
                    enabled_filetypes = {
                        "markdown",
                    },
                    disable_command_mode = true,
                },
            },
        })
    end,
}
