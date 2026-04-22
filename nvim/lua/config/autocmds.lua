
-- open help window on the right
vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = {"help"},
        command = "wincmd L",
    }
)

-- press q to close help window
vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = {"help"},
        command = "noremap <buffer> q :bd<CR>",
    }
)

-- set relative line numbers (in normal mode)
vim.api.nvim_create_autocmd(
    {"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
        pattern = "*",
        command = "if &nu && mode() != 'i' | set rnu   | endif",
    }
)
vim.api.nvim_create_autocmd(
    {"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
        pattern = "*",
        command = "if &nu | set nornu | endif",
    }
)
-- autocmd FileType * set formatoptions-=o
vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = "*",
        command = "setlocal formatoptions+=t",
    }
)

-- local autocmd = vim.api.nvim_create_autocmd
--
-- autocmd("VimEnter", {
--   callback = function()
--     --NVIM_ENTER=1
--     vim.cmd([[call chansend(v:stderr, "\033]1337;SetUserVar=NVIM_ENTER=MQ==\007")]])
--   end,
-- })
--
-- autocmd("VimLeavePre", {
--   callback = function()
--     --NVIM_ENTER=0
--     vim.cmd([[call chansend(v:stderr, "\033]1337;SetUserVar=NVIM_ENTER=MA==\007")]])
--   end,
-- })


-- auto format go files
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

