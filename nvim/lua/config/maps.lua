vim.keymap.set("n", "<CR>", ":")
vim.keymap.set("n", "<C-s>", "<tab>")
vim.keymap.set("n", "<tab>", "<c-z>")



vim.keymap.set("n", "<Leader>n", ":enew<CR>")

vim.keymap.set("i", "<C-P>", "<Up>")
vim.keymap.set("i", "<C-N>", "<Down>")

vim.keymap.set("n", "<Leader>w", "<C-w>")

vim.keymap.set("n", "<C-G>", ":noh<CR><C-C><C-L>")
vim.keymap.set("n", "<C-C>", ":noh<CR><C-C><C-L>")

vim.keymap.set("n", "<Leader>v", ":e $MYVIMRC<CR>")

vim.keymap.set("v", "<Leader>y", "\"+y")

vim.keymap.set("n", "<Leader><CR>", ":vsp<CR>")
vim.keymap.set("n", "<Leader><S-CR>", ":sp<CR>")

vim.keymap.set("n", "<Leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<Leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>")

vim.keymap.set("n", "<Leader>1", ":tabn 1<CR>")
vim.keymap.set("n", "<Leader>2", ":tabn 2<CR>")
vim.keymap.set("n", "<Leader>3", ":tabn 3<CR>")
vim.keymap.set("n", "<Leader>4", ":tabn 4<CR>")
vim.keymap.set("n", "<Leader>5", ":tabn 5<CR>")
vim.keymap.set("n", "<Leader>6", ":tabn 6<CR>")

vim.keymap.set("n", "<Leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<Leader>w", ":tabc<CR>")
vim.keymap.set("n", "<Leader><C-n>", ":tabn<CR>")
vim.keymap.set("n", "<Leader><C-p>", ":tabp<CR>")

vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")

 -- toggle diagnostics with <Leader>
vim.keymap.set("n", "<Leader>/", function()
    local diagnostics_enabled = vim.diagnostic.is_enabled()
    if diagnostics_enabled then
        vim.diagnostic.disable()
        print("Diagnostics disabled")
    else
        vim.diagnostic.enable()
        print("Diagnostics enabled")
    end
end)



