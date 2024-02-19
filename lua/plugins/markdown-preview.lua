return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,

    init = function()
        vim.api.nvim_exec(
            [[
                function OpenMarkdownPreview(url)
                    execute "silent ! firefox --new-window " . a:url
                endfunction
                let g:mkdp_browserfunc = 'OpenMarkdownPreview'
            ]],
            false
        )
        vim.g.mkdp_auto_start = 1
    end,
}
