return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("neo-tree").setup({
            filesystem = {
                window = {
                    position = right,
                    width = 1,
                    auto_expand_width = true,
                    popup = {
                        position = {
                            col = "100%",
                            row = "2"
                        },
                        size = function(state)
                            local root_name = vim.fn.fnamemodify(state.path, ":~")
                            local root_len = string.len(root_name) + 4
                            return {
                                width = math.max(root_len, 50),
                                height = vim.o.lines - 6
                            }
                        end
                    },
                }
            }
        })
        vim.keymap.set('n', '<leader>fs', ':Neotree filesystem right reveal toggle<CR>')
    end
}
