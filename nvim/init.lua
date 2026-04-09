-- ========================================
-- ====           LEADER KEY           ====
-- ========================================

-- Make sure to set the leader key before lazy so your mappings are correct
vim.g.mapleader = " "


-- ========================================
-- ====              LAZY              ====
-- ========================================
-- require("config.lazy")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- ========================================
-- ====            PLUGINS             ====
-- ========================================

require("lazy").setup({
    spec = {
        -- MUST HAVES
        {"tomtom/tcomment_vim"}, -- gcc to add native comment
        -- {"tmsvg/pear-tree"},    -- completes quotes as you type
        {"tpope/vim-rsi"}, -- readline key bindings in insert mode
        {"junegunn/fzf"},
        {"junegunn/fzf.vim"},
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        {"vim-airline/vim-airline"},
        {"vim-airline/vim-airline-themes"},
        {"vim-scripts/VimCompletesMe"}, -- minimal, light-weight tab-completion
        {"airblade/vim-rooter"}, -- chdir to root dir of project
        {"stevearc/oil.nvim"}, -- file viewer
        {"github/copilot.vim"},
        -- {"dense-analysis/ale"}, -- linter
        -- {"sheerun/vim-polyglot"}, -- syntax highlighting
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",},
        {
            "Isrothy/neominimap.nvim",
            version = "v3.*.*",
            enabled = true,
            init = function()
                -- The following options are recommended when layout == "float"
                -- vim.opt.wrap = false
                -- vim.opt.sidescrolloff = 36 -- Set a large value

                --- Put your configuration here
                ---@type Neominimap.UserConfig
                vim.g.neominimap = {
                    auto_enable = true,
                    -- layout = "split", ---@type Neominimap.Config.LayoutType
                    float = {
                        minimap_width = 15, ---@type integer
                    }
                }
            end,
        },
        {"rose-pine/neovim"}, -- theme
        {"AlexvZyl/nordic.nvim"},
        -- TAKE IT OR LEAVE IT
        {"catppuccin/nvim"}, -- I think going with this, since it has the most github stars and community support
        {"lewis6991/gitsigns.nvim"},
        {"folke/zen-mode.nvim"},
        -- TRYING OUT
        {"ibhagwan/fzf-lua"},
        {"nvim-lua/plenary.nvim"},
        {
            "scalameta/nvim-metals",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            ft = { "scala", "sbt", "java" },
            opts = function()
                local metals_config = require("metals").bare_config()
                metals_config.on_attach = function(client, bufnr)
                    -- your on_attach function
                    vim.keymap.set("n", "K", vim.lsp.buf.hover)
                    -- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
                    -- vim.keymap.set("n", "<leader>gd", require("telescope.builtin").lsp_definitions )
                    -- vim.keymap.set("n", "<leader>gd", require("fzf-lua").lsp_definitions )
                    -- vim.keymap.set("n", "<leader>gd", require("fzf-lua").lsp_definitions({ jump_to_single_result = true }) )
                    vim.keymap.set("n", "<leader>gd", function () require("fzf-lua").lsp_definitions({ jump_to_single_result = true }) end )
                    vim.keymap.set("n", "<leader>gr", function () require("fzf-lua").lsp_references({ jump_to_single_result = true }) end )
                    vim.keymap.set("n", "<leader>ir", vim.lsp.buf.references)
                    vim.keymap.set("n", "<leader>M", ":Telescope metals commands<CR>")
                end

                return metals_config
            end,
            config = function(self, metals_config)
                local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
                vim.api.nvim_create_autocmd("FileType", {
                        pattern = self.ft,
                        callback = function()
                            require("metals").initialize_or_attach(metals_config)
                        end,
                        group = nvim_metals_group,
                    })
            end
        },
        {
            "sphamba/smear-cursor.nvim",
            opts = {},
        },
        {
            "karb94/neoscroll.nvim",
            config = function ()
                require('neoscroll').setup({
                    easing = "quadratic",
                })
            end
        },
        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "sindrets/diffview.nvim",
                "ibhagwan/fzf-lua",
            },
            config = true
        },
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {"tpope/vim-surround"}, -- change surrounding characters
        { "mrjones2014/smart-splits.nvim" },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
            -- use opts = {} for passing setup options
            -- this is equivalent to setup({}) function
        },
        {
          "j-hui/fidget.nvim",
          opts = {
            -- options
          },
        },
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/cmp-vsnip" },
                { "hrsh7th/vim-vsnip" }
            },
            opts = function()
                local cmp = require("cmp")
                local conf = {
                    sources = {
                        { name = "nvim_lsp" },
                        { name = "vsnip" },
                    },
                    snippet = {
                        expand = function(args)
                            -- Comes from vsnip
                            fn["vsnip#anonymous"](args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        -- None of this made sense to me when first looking into this since there
                        -- is no vim docs, but you can't have select = true here _unless_ you are
                        -- also using the snippet stuff. So keep in mind that if you remove
                        -- snippets you need to remove this select
                        ["<CR>"] = cmp.mapping.confirm({ select = true })
                    })
                }
                return conf
            end
        },
    },
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- },
})


-- ========================================
-- ====           NEOMINIMAP           ====
-- ========================================

vim.keymap.set("n", "<leader>m", ":Neominimap toggle<CR>")

-- toggle neominimap when entering/leaving a window
vim.api.nvim_create_autocmd(
    {"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
        pattern = "*",
        command = "Neominimap winOn",
    }
)
vim.api.nvim_create_autocmd(
    {"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
        pattern = "*",
        command = "Neominimap winOff",
    }
)


-- ========================================
-- ====           NEOSCROLL            ====
-- ========================================

neoscroll = require('neoscroll')
vim.keymap.set("n", "<C-U>", function () neoscroll.ctrl_u({ duration = 120}) end )
vim.keymap.set("n", "<C-D>", function () neoscroll.ctrl_d({ duration = 120}) end )
vim.keymap.set("n", "<C-B>", function () neoscroll.ctrl_b({ duration = 250}) end )
vim.keymap.set("n", "<C-F>", function () neoscroll.ctrl_f({ duration = 250}) end )
vim.keymap.set("n", "<C-Y>", function () neoscroll.scroll(-0.1, { move_cursor=false; duration = 20 }) end )
vim.keymap.set("n", "<C-E>", function () neoscroll.scroll(0.1, { move_cursor=false; duration = 20 }) end )


-- ========================================
-- ====            AIRLINE             ====
-- ========================================
vim.g['airline_section_x'] = "%{&filetype}"
vim.g['airline_section_y'] = ""
vim.g['airline_section_z'] = "%{g:airline_symbols.maxlinenr} %l:%p%%"

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

vim.api.nvim_exec([[
  let g:airline#extensions#default#layout = [
      \ [ 'a', 'c', 'b' ],
      \ [ 'x', 'y', 'z', 'error', 'warning' ]
      \ ]
]], false)

vim.g['airline#extensions#branch#displayed_head_limit'] = 15

vim.g['airline_exclude_filetypes'] = {'minimap'}

vim.g['airline_theme'] = "distinguished"
-- vim.g['airline_theme'] = 'papercolor'
-- vim.g['airline_theme'] = "catppuccin"

-- " LSP support
-- let g:airline#extensions#nvimlsp#enabled = 1
-- let g:airline#extensions#nvimlsp#error_symbol = 'E'
-- let g:airline#extensions#nvimlsp#warning_symbol = 'W'
vim.g['airline#extensions#nvimlsp#enabled'] = 1
vim.g['airline#extensions#nvimlsp#error_symbol'] = 'E'
vim.g['airline#extensions#nvimlsp#warning_symbol'] = 'W'


-- ========================================
-- ====            COPILOT             ====
-- ========================================
-- vim.g.copilot_filetypes = {markdown = true}


-- ========================================
-- ====              OIL               ====
-- ========================================
require("oil").setup(
    {
        view_options = {
            show_hidden = true,
        }
    }
)
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })


-- ========================================
-- ====             ROOTER             ====
-- ========================================
vim.g.rooter_silent_chdir = 1


-- ========================================
-- ====              FZF               ====
-- ========================================
vim.keymap.set("n", "<Leader>e", ":Files<CR>")
-- vim.keymap.set("n", "<Leader>t", ":Tags<CR>")
vim.keymap.set("n", "<Leader>r", ":History<CR>")
vim.keymap.set("n", "<Leader><Leader>", ":Buffers<CR>")
-- search for word under cursor
-- vim.keymap.set("n", "<Leader>r", ":Rg! <C-R><C-W><CR>")
-- vim.keymap.set("n", "<Leader>f", ":Rg<CR>")
vim.keymap.set("n", "<Leader>f", ":Rg<CR>")


-- ========================================
-- ====            ZENMODE             ====
-- ========================================
vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>")
-- require("zen-mode").setup({
--     window = {
--         backdrop = 0.50,
--         width = 140
--     }
-- })


-- ========================================
-- ====           TREESITTER           ====
-- ========================================

require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "scala" },
    highlight = { enable = true },
    -- highlight = { enable = false },
    indent = { enable = true },
}

-- ========================================
-- ====             NEOGIT             ====
-- ========================================
vim.keymap.set("n", "<Leader>gs", function () require("neogit").open({ kind = "floating" }) end )


-- ========================================
-- ====          VIM SETTINGS          ====
-- ========================================
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = false
vim.opt.hlsearch = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.formatoptions:append("t")

vim.cmd("syntax on")
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme nord")
vim.cmd("colorscheme nordic")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
-- vim.cmd("set background=light")
-- vim.cmd("colorscheme PaperColor")
-- vim.cmd("colorscheme iceberg")
-- vim.cmd("colorscheme habaurora")
-- vim.cmd("colorscheme catppuccin-mocha") <- last enabled
-- vim.cmd("colorscheme catppuccin-latte")
vim.cmd("set number")
vim.cmd("set mouse=")
vim.cmd("set incsearch")
vim.cmd("set invlist")
vim.cmd("set nomodeline")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.cmd("set softtabstop=4")
-- vim.cmd("set formatoptions+=t")
vim.cmd("set wrapmargin=20")

vim.g.netrw_banner = 0

vim.lsp.set_log_level("debug")


-- ========================================
-- ====            VIM KEYS            ====
-- ========================================
vim.keymap.set("n", "<CR>", ":")

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

-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

-- ========================================
-- ====         VIM AUTOCMDS           ====
-- ========================================

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


-- ========================================
-- ====          EXPERIMENTAL          ====
-- ========================================



