-- set runtimepath^=~/.vim runtimepath+=~/.vim/after
-- let &packpath=&runtimepath

-- source ~/.vimrc


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- *******
-- Minimap
-- *******
vim.g.minimap_width = 10
-- vim.g.minimap_auto_start = 1
-- vim.g.minimap_auto_start_win_enter = 1
-- vim.g.minimap_block_filetypes = {'netrw'}
vim.keymap.set("n", "<Leader>m", ":MinimapToggle<CR>")


-- *******
-- plugins
-- *******
require("lazy").setup({
    -- must haves
    {"rose-pine/neovim"},
    {"wfxr/minimap.vim"},
    {"tomtom/tcomment_vim"},
    {"tpope/vim-rsi"},
    {"junegunn/fzf"},
    {"junegunn/fzf.vim"},
    {"vim-scripts/VimCompletesMe"},
    -- {"lifepillar/vim-mucomplete"},
    -- take it or leave it
    {"dense-analysis/ale"},
    {"tmsvg/pear-tree"},
    {"sheerun/vim-polyglot"},
    {"airblade/vim-rooter"},
    -- {"github/copilot.vim"},
    -- trying out
    -- {"tpope/vim-obsession"},
    -- {"tpope/vim-vinegar"},
    {"stevearc/oil.nvim"},
    {"vim-airline/vim-airline"},
    {"vim-airline/vim-airline-themes"},
    -- {"nvim-tree/nvim-tree.lua"}
    {"preservim/nerdtree"},
    {"fatih/vim-go"}
})

-- ********
-- nvim-tree
-- ********
-- require("nvim-tree").setup()

-- vim.keymap.set("n", "<Leader>t", require("nvim-tree.api").tree.toggle)
vim.keymap.set("n", "\\", ":NERDTreeToggle<CR>")


-- ********
-- airline
-- ********
vim.g['airline_section_x'] = "%{&filetype}"
vim.g['airline_section_y'] = ""
vim.g['airline_section_z'] = "%{g:airline_symbols.maxlinenr} %l:%p%%"
-- vim.g['airline_section_z'] = "%v%{g:airline_symbols.maxlinenr}%l%{g:airline_symbols.linenr} %p%%"

vim.g['airline_theme'] = "distinguished"
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_skip_empty_sections'] = 1
--
vim.g['airline_symbols.linenr'] = '¶'
vim.g['airline_symbols.colnr'] = 'Ξ'
vim.g['airline_symbols.branch'] = '⎇'
vim.g['airline_symbols.paste'] = 'ρ'
vim.g['airline_left_sep'] = ''
vim.g['airline_left_alt_sep'] = ''
vim.g['airline_right_sep'] = ''
vim.g['airline_right_alt_sep'] = ''

vim.g['airline#extensions#searchcount#enabled'] = 0


-- ********
-- settings
-- ********
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = false
vim.opt.hlsearch = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.cmd("syntax on")
-- vim.cmd("colorscheme rose-pine")
vim.cmd("colorscheme rose-pine-moon")
vim.cmd("set number")
vim.cmd("set mouse=")
vim.cmd("set incsearch")
vim.cmd("set invlist")



vim.g.mapleader = ' '

vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 4

-- ********
-- oil.nvim
-- ********

require("oil").setup()
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })


-- *******
-- fzf.vim
-- *******
vim.keymap.set("n", "<Leader>e", ":Files<CR>")
vim.keymap.set("n", "<Leader><Leader>", ":Buffers<CR>")
vim.keymap.set("n", "<Leader>r", ":History:<CR>")

-- search for word under cursor
vim.keymap.set("n", "<Leader>rg", ":Rg! <C-R><C-W><CR>")
-- <Leader>ag :Ag <C-R><C-W><CR>


-- ****
-- keys
-- ****
vim.keymap.set("i", "<C-P>", "<Up>")
vim.keymap.set("i", "<C-N>", "<Down>")

vim.keymap.set("c", "<C-G>", "<silent> <C-C>")
vim.keymap.set("n", "<C-G>", "<silent> <C-C>")
vim.keymap.set("n", "<C-C>", "<silent> <C-C>")
vim.keymap.set("n", "<CR>", ":noh<CR><CR>")


-- vim.keymap.set("n", "<C-H>", "<C-W>h")
-- vim.keymap.set("n", "<C-J>", "<C-W>j")
-- vim.keymap.set("n", "<C-K>", "<C-W>k")
-- vim.keymap.set("n", "<C-L>", "<C-W>l")

-- noremap <C-h> <C-w>h
-- noremap <C-j> <C-w>j
-- noremap <C-k> <C-w>k
-- noremap <C-l> <C-w>l

vim.keymap.set("n", "<Leader><CR>", ":vsp<CR>")
vim.keymap.set("n", "<Leader><S-CR>", ":sp<CR>")

vim.keymap.set("n", "gn", ":bnext<CR>")
vim.keymap.set("n", "gp", ":bprevious<CR>")
vim.keymap.set("n", "gd", ":bdelete<CR>")

vim.keymap.set("n", "<Leader>d", "<C-W>c")
vim.keymap.set("n", "<Leader>h", "<C-W>h")
vim.keymap.set("n", "<Leader>j", "<C-W>j")
vim.keymap.set("n", "<Leader>k", "<C-W>k")
vim.keymap.set("n", "<Leader>l", "<C-W>l")

vim.keymap.set("n", "<Leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<Leader>w", ":tabclose<CR>")
vim.keymap.set("n", "<Leader>p", ":tabp<CR>")
vim.keymap.set("n", "<Leader>n", ":tabn<CR>")

vim.keymap.set("n", "<Leader>1", ":tabn 1<CR>")
vim.keymap.set("n", "<Leader>2", ":tabn 2<CR>")
vim.keymap.set("n", "<Leader>3", ":tabn 3<CR>")
vim.keymap.set("n", "<Leader>4", ":tabn 4<CR>")
vim.keymap.set("n", "<Leader>5", ":tabn 5<CR>")
vim.keymap.set("n", "<Leader>6", ":tabn 6<CR>")





-- ************
-- Experimental
-- ************


vim.keymap.set("n", "<Leader>F", ":Rg<CR>")

-- autocmd FileType help wincmd L
vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = {"help"},
        command = "wincmd L",
    }
)

-- autocmd FileType help noremap <buffer> q :q<cr>
vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = {"help"},
        command = "noremap <buffer> q :bd<CR>",
    }
)

-- autocmd FileType help wincmd o
vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = {"help"},
        command = "wincmd o",
    }
)

-- autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
vim.api.nvim_create_autocmd(
    "BufEnter", {
        pattern = {"*"},
        command = "if (winnr(\"$\") == 1 && exists(\"b:NERDTree\") && b:NERDTree.isTabTree()) | q | endif",
    }
)

-- autocmd vimenter * if !argc() | NERDTree | endif
-- vim.api.nvim_create_autocmd(
--     "VimEnter", {
--         pattern = {"*"},
--         command = "if !argc() | NERDTree | endif",
--     }
-- )
