-- return {
--     "echasnovski/mini.pick",
--     version = '*', -- use the latest commit
--   -- config = function()
--   --   local pick = require('mini.pick')
--   --   pick.setup()
--     -- end
--
--     keys = {
--         -- { "<leader>ff", function() require('mini.pick').builtin.files() end, desc = "Pick files" },
--         -- { "<leader>fb", function() require('mini.pick').builtin.buffers() end, desc = "Pick buffers" },
--         { "<leader>lg", function() require('mini.pick').builtin.live_grep() end, desc = "Live grep" },
--         -- { "<leader>fh", function() require('mini.pick').builtin.help() end, desc = "Help tags" },
--         -- { "<leader>fm", function() require('mini.pick').builtin.marks() end, desc = "Pick marks" },
--     }
--     -- Optional keymaps
--     -- vim.keymap.set('n', '<leader>ff', pick.builtin.files, { desc = 'Pick files' })
--     -- vim.keymap.set('n', '<leader>fb', pick.builtin.buffers, { desc = 'Pick buffers' })
--     -- vim.keymap.set('n', '<leader>fl', pick.builtin.live_grep, { desc = 'Live grep' })
--     -- vim.keymap.set('n', '<leader>fh', pick.builtin.help, { desc = 'Help tags' })
--     -- vim.keymap.set('n', '<leader>fm', pick.builtin.marks, { desc = 'Pick marks' })
-- }
--

local win_config = function()
    height = math.floor(0.618 * vim.o.lines)
    width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW', height = height, width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end

return {
    "echasnovski/mini.pick",
    version = '*',
    opts = {
        window = { config = win_config },
    },
    keys = {
        { "<leader>f", function() require('mini.pick').builtin.grep_live() end, desc = "Live grep" },
    }
}

