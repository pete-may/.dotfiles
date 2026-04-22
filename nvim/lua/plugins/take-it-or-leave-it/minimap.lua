return {
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
    keys = {
        { "<leader>m", ":Neominimap toggle<CR>", desc = "Toggle global minimap" },
    },
    config = function()
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
    end,
}

