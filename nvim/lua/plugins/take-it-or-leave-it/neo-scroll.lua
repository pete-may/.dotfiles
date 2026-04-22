return {
    "karb94/neoscroll.nvim",
    config = function ()
        require('neoscroll').setup({
            easing = "quadratic",
        })
    end,
    keys = {
        -- { "<C-U>", function () require('neoscroll').neoscroll.ctrl_u({ duration = 120}) end },
        -- { "<C-D>", function () require('neoscroll').neoscroll.ctrl_d({ duration = 120}) end },
        { "<C-U>", function () require('neoscroll').neoscroll.ctrl_u({ duration = 20}) end },
        { "<C-D>", function () require('neoscroll').neoscroll.ctrl_d({ duration = 20}) end },
        { "<C-B>", function () require('neoscroll').neoscroll.ctrl_b({ duration = 250}) end },
        { "<C-F>", function () require('neoscroll').neoscroll.ctrl_f({ duration = 250}) end },
        { "<C-Y>", function () require('neoscroll').neoscroll.scroll(-0.1, { move_cursor=false; duration = 20 }) end },
        { "<C-E>", function () require('neoscroll').neoscroll.scroll(0.1, { move_cursor=false; duration = 20 }) end },
    },
}

