-- vim.cmd("syntax on")
-- vim.cmd("colorscheme rose-pine")  -- you can't beat it
-- vim.cmd("colorscheme nordic")
-- vim.cmd("colorscheme kanagawa")   -- this one was last enabled
-- vim.cmd("colorscheme kanagawa-wave")
vim.cmd("colorscheme kanagawa-dragon")   -- if I had the stones, I would use this one
-- vim.cmd("colorscheme kanagawa-lotus")
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme melange")

-- zenbones
-- vim.cmd("colorscheme kanagawabones")
-- vim.cmd("colorscheme rosebones")
-- vim.cmd("colorscheme seoulbones")          -- this one isn't bad
-- vim.cmd("colorscheme nordbones")
-- vim.cmd("colorscheme randombones")
-- vim.cmd("colorscheme zenwritten")
-- vim.cmd("colorscheme vimbones")
-- vim.cmd("colorscheme neobones")            -- don't hate this one
-- vim.cmd("colorscheme forestbones")         -- kinda like this one too
-- vim.cmd("colorscheme duckbones")
-- vim.cmd("colorscheme zenburned")           -- spicy



-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none", guibg = "black" })
-- highlight Normal ctermbg=NONE guibg=black

local line_nr_hl = vim.api.nvim_get_hl(0, { name = "LineNr", link = false })
vim.api.nvim_set_hl(0, "LineNr", {
    fg = line_nr_hl.fg,
    bg = "none"
})
-- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })

-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })

vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none" })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { bg = "none" })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { bg = "none" })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { bg = "none" })

local git_signs_add_hl = vim.api.nvim_get_hl(0, { name = "GitSignsAdd", link = false })
vim.api.nvim_set_hl(0, "GitSignsAdd", {
    fg = git_signs_add_hl.fg,
    bg = "none" 
})
local git_signs_change_hl = vim.api.nvim_get_hl(0, { name = "GitSignsChange", link = false })
vim.api.nvim_set_hl(0, "GitSignsChange", {
    fg = git_signs_change_hl.fg,
    bg = "none"
})
local git_signs_delete = vim.api.nvim_get_hl(0, { name = "GitSignsDelete", link = false })
vim.api.nvim_set_hl(0, "GitSignsDelete", {
    fg = git_signs_delete.fg,
    bg = "none"
})
