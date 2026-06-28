-- Monitor Configuration
-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})


hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


-- variables for keybinds
local browser     = "firefox"
local terminal    = "foot"
local fileManager = "dolphin"
local menu        = "fuzzel"


-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_THEME","breeze_cursors")
hl.env("XCURSOR_SIZE","60")
hl.env("GTK_THEME","Breeze-Dark")

-- Necessary for KDE applications to work properly
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("XDG_MENU_PREFIX", "plasma-")

hl.env("QT_QPA_PLATFORM","wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")



-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
		resize_on_border = false, -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        allow_tearing = false, -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        layout = "master",
    },
    decoration = {
        rounding       = 10,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
})


