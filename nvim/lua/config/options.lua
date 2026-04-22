vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = false
vim.opt.hlsearch = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.formatoptions:append("t")

vim.cmd("set number")
vim.cmd("set mouse=")
vim.cmd("set incsearch")
vim.cmd("set invlist")
vim.cmd("set nomodeline")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.cmd("set softtabstop=4")
-- vim.cmd("set formatoptions+=t")
-- vim.cmd("set wrapmargin=20")

vim.g.netrw_banner = 0

-- vim.lsp.set_log_level("debug")


vim.diagnostic.config({ virtual_text = true })

-- Interesting... check this out later
-- local group = vim.api.nvim_create_augroup('OoO', {})
--
-- local function au(typ, pattern, cmdOrFn)
-- 	if type(cmdOrFn) == 'function' then
-- 		vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
-- 	else
-- 		vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
-- 	end
-- end
--
-- au('InsertEnter', nil, function()
-- 	vim.diagnostic.enable(false)
-- end)
--
-- au('InsertLeave', nil, function()
-- 	vim.diagnostic.enable(true)
-- end)
