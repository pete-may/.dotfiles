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

-- config.colors = {
--   cursor_bg = "#000000",
--   cursor_fg = "#FFFFFF",
--   cursor_border = "#000000",
-- }

config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Menlo", {weight="Bold", italic=true})
-- config.font = wezterm.font("Menlo")

-- config.window_padding = {
--   left = 3, right = 3,
--   top = 3, bottom = 3,
-- }

config.font_size = 15




-- ********
-- settings
-- ********

config.hide_tab_bar_if_only_one_tab = true

-- config.send_composed_key_when_left_alt_is_pressed = true

-- config.debug_key_events = true

config.selection_word_boundary = " \t\n{}[]()\"'`|/.,;:"


config.window_background_opacity = 0.95
-- config.window_background_opacity = 0.9
-- config.window_background_opacity = 0.85
-- config.window_background_opacity = 0.75
-- config.window_background_opacity = 0.7
-- config.window_decorations = "NONE"



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
  {
    key = 'b',
    mods = 'CMD',
    action = wezterm.action.RotatePanes 'CounterClockwise',
  },
}






-- config.window_decorations = "TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"




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

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
-- you have to use this instead, but note that this will not work
-- in all cases (e.g. over an SSH connection). Also note that
-- `pane:get_foreground_process_name()` can have high and highly variable
-- latency, so the other implementation of `is_vim()` will be more
-- performant as well.
local function is_vim(pane)
  -- This gsub is equivalent to POSIX basename(3)
  -- Given "/foo/bar" returns "bar"
  -- Given "c:\\foo\\bar" returns "bar"
  local process_name = string.gsub(pane:get_foreground_process_name(), '(.*[/\\])(.*)', '%2')
  return process_name == 'nvim' or process_name == 'vim'
end

local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

-- resize panes
table.insert(config.keys, split_nav('move', 'h'))
table.insert(config.keys, split_nav('move', 'j'))
table.insert(config.keys, split_nav('move', 'k'))
table.insert(config.keys, split_nav('move', 'l'))
-- move between split panes
table.insert(config.keys, split_nav('resize', 'h'))
table.insert(config.keys, split_nav('resize', 'j'))
table.insert(config.keys, split_nav('resize', 'k'))
table.insert(config.keys, split_nav('resize', 'l'))

config.window_background_gradient = {
  colors = { '#EEBD89', '#D13ABD' },
  -- Specifies a Linear gradient starting in the top left corner.
  orientation = { Linear = { angle = -45.0 } },
}

config.window_background_gradient = {
  -- Can be "Vertical" or "Horizontal".  Specifies the direction
  -- in which the color gradient varies.  The default is "Horizontal",
  -- with the gradient going from left-to-right.
  -- Linear and Radial gradients are also supported; see the other
  -- examples below
  orientation = 'Vertical',

  -- Specifies the set of colors that are interpolated in the gradient.
  -- Accepts CSS style color specs, from named colors, through rgb
  -- strings and more
  -- colors = {
  --   '#0f0c29',
  --   '#302b63',
  --   '#24243e',
  -- },
  -- colors = {
  --   '#070614',
  --   '#2b2759',
  --   '#1c1c31',
  -- },
  colors = {
    '#070614',
    '#302b63',
    '#1c1c31',
  },

  -- Instead of specifying `colors`, you can use one of a number of
  -- predefined, preset gradients.
  -- A list of presets is shown in a section below.
  -- preset = "Warm",
  -- preset = "Greys",

  -- Specifies the interpolation style to be used.
  -- "Linear", "Basis" and "CatmullRom" as supported.
  -- The default is "Linear".
  interpolation = 'Linear',

  -- How the colors are blended in the gradient.
  -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
  -- The default is "Rgb".
  blend = 'Rgb',

  -- To avoid vertical color banding for horizontal gradients, the
  -- gradient position is randomly shifted by up to the `noise` value
  -- for each pixel.
  -- Smaller values, or 0, will make bands more prominent.
  -- The default value is 64 which gives decent looking results
  -- on a retina macbook pro display.
  -- noise = 64,

  -- By default, the gradient smoothly transitions between the colors.
  -- You can adjust the sharpness by specifying the segment_size and
  -- segment_smoothness parameters.
  -- segment_size configures how many segments are present.
  -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
  -- 1.0 is a soft edge.

  -- segment_size = 11,
  -- segment_smoothness = 0.5,
}

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.window_content_alignment = {
  horizontal = 'Center',
  vertical = 'Center',
}

-- config.window_content_alignment = {
--   horizontal = 'Center',
--   vertical = 'Center',
-- }
-- local padding = {
--   left = '1cell',
--   right = '1cell',
--   top = '0.5cell',
--   bottom = '0.5cell',
-- }
--
-- wezterm.on('user-var-changed', function(window, pane, name, value)
--   if name == "NVIM_ENTER" then
--     local overrides = window:get_config_overrides() or {}
--     if value == "1" then
--       overrides.window_padding = {
--         left = 0,
--         right = 0,
--         top = 0,
--         bottom = 0
--       }
--     else
--       overrides.window_padding = padding
--     end
--     window:set_config_overrides(overrides)
--   end
-- end)

return config
