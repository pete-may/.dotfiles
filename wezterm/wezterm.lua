-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end



-- **********
-- appearance
-- **********


-- config.color_scheme = 'AdventureTime'

config.color_scheme = 'Afterglow'
-- config.colors = require("cfg_bew_colors")
-- config.color_scheme = 'Builtin Solarized Light'

-- experimental themes

-- config.font = wezterm.font("JetBrains Mono", {weight="Bold", italic=true})

-- Specift the color of the selection
config.colors = {selection_bg = '#52ad70',}

config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Menlo", {weight="Bold", italic=true})
-- config.font = wezterm.font("Menlo")

config.window_padding = {
  left = 3, right = 3,
  top = 3, bottom = 3,
}

config.font_size = 15




-- ********
-- settings
-- ********

config.hide_tab_bar_if_only_one_tab = true

-- config.send_composed_key_when_left_alt_is_pressed = true

-- config.debug_key_events = true

config.selection_word_boundary = " \t\n{}[]()\"'`|/.,;:"




-- ****
-- keys
-- ****

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'Enter',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'p',
    mods = 'CMD|CTRL',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 'n',
    mods = 'CMD|CTRL',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.TogglePaneZoomState,
  },
}



-- wezterm naviatgion settings
-- local wezterm = require('wezterm')
--
-- local function isViProcess(pane)
--     -- get_foreground_process_name On Linux, macOS and Windows, 
--     -- the process can be queried to determine this path. Other operating systems 
--     -- (notably, FreeBSD and other unix systems) are not currently supported
--     return pane:get_foreground_process_name():find('n?vim') ~= nil
--     -- return pane:get_title():find("n?vim") ~= nil
-- end
--
-- local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
--     if isViProcess(pane) then
--         window:perform_action(
--             -- This should match the keybinds you set in Neovim.
--             wezterm.action.SendKey({ key = vim_direction, mods = 'CTRL' }),
--             pane
--         )
--     else
--         window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
--     end
-- end
--
-- wezterm.on('ActivatePaneDirection-right', function(window, pane)
--     conditionalActivatePane(window, pane, 'Right', 'l')
-- end)
-- wezterm.on('ActivatePaneDirection-left', function(window, pane)
--     conditionalActivatePane(window, pane, 'Left', 'h')
-- end)
-- wezterm.on('ActivatePaneDirection-up', function(window, pane)
--     conditionalActivatePane(window, pane, 'Up', 'k')
-- end)
-- wezterm.on('ActivatePaneDirection-down', function(window, pane)
--     conditionalActivatePane(window, pane, 'Down', 'j')
-- end)
--
-- table.insert(config.keys, { key = 'h', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-left')})
-- table.insert(config.keys, { key = 'j', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-down')})
-- table.insert(config.keys, { key = 'k', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-up')})
-- table.insert(config.keys, { key = 'l', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-right')})

-- table.insert(config.keys, { key = 'h', mods = 'CTRL', action = wezterm.action.SendKey({ key = 'l', mods = 'CTRL' })})








config.window_decorations = "TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"




local search_mode = nil
if wezterm.gui then
  search_mode = wezterm.gui.default_key_tables().search_mode
  table.insert(
    search_mode,
    { key = 'g', mods = 'CTRL', action = wezterm.action.CopyMode 'Close' }
  )
  table.insert(
    search_mode,
    { key = 'c', mods = 'CTRL', action = wezterm.action.CopyMode 'Close' }
  )
end

config.key_tables = {
    search_mode = search_mode,
}


-- and finally, return the configuration to wezterm
return config

