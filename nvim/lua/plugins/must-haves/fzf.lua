return {
    { "junegunn/fzf" },     -- tried removed this, it didn't end well
    {
        "junegunn/fzf.vim",
        keys = {
            { "<Leader>e", ":Files<CR>" },
            { "<Leader>r", ":History<CR>"},
            { "<Leader><Leader>", ":Buffers<CR>"},
            -- { "<Leader>f", ":Rg<CR>"},
        -- vim.keymap.set("n", "<Leader>t", ":Tags<CR>")
        -- search for word under cursor
        -- vim.keymap.set("n", "<Leader>r", ":Rg! <C-R><C-W><CR>")
        },
    },
}
