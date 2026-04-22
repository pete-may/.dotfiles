return {
    {"vim-airline/vim-airline",
        config = function ()
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
        end,
    },
    { "vim-airline/vim-airline-themes" },
}

