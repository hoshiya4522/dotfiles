-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local browser     = "firefox"
local terminal    = "foot"
-- local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "fuzzel"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function () 
	-- Necessary for KDE applications to work properly
	hl.exec_cmd("kded6")
	hl.exec_cmd("kbuildsycoca6")

	hl.exec_cmd("waybar") -- bar

	hl.exec_cmd("swayosd-server") -- OSD 
	hl.exec_cmd("swaync") -- notification center
	-- hl.exec_cmd("flameshot") -- screenshot

	-- Clipboard (requires cliphist)
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Alt Tab (Requires snappy-switcher)
	hl.exec_cmd("snappy-switcher --daemon")

	-- Hotcorners (Requires waycorner)
	hl.exec_cmd("waycorner")

	-- hyprpm
	hl.exec_cmd("hyprpm reload")

	-- nwg-loog themes load
	hl.exec_cmd("nwg-look -a")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- hl.env("XCURSOR_SIZE", "48")
-- hl.env("HYPRCURSOR_SIZE", "48")
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

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

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

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "master",
        -- layout = "dwindle",
        -- layout = "scrolling",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
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

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("idk",				{ type = "bezier", points = { {0, 0},       {0, 0}       } })
hl.curve("easeOutQuint",	{ type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic",	{ type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",			{ type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",	{ type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",			{ type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
-- hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspaces",    enabled = true,  speed = 3,    bezier = "linear",      style = "slidevert" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 3,    bezier = "idk",          style = "slidevert" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "slidevert" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        explicit_column_widths = "0.333, 0.667, 1.0", -- like niri
        column_width = 0.5 -- for newly opened windows
    }
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
		-- Absolute 100x developer
        kb_options = "caps:escape_shifted_capslock",
        kb_rules   = "",



        follow_mouse = 1,
		-- force_no_accel = 1,
		-- accel_profile = "flat",

        sensitivity = 0.5, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
			disable_while_typing = true,
			natural_scroll = true,

			-- https://wayland.freedesktop.org/libinput/doc/latest/tapping.html#tap-and-drag
			tap_and_drag = true,
			drag_lock = 1
        },
    },
})

hl.gesture({
    fingers = 3,
    -- direction = "horizontal",
    direction = "vertical", -- specifically for workspace animation -slidevert
    action = "workspace"
})

hl.device({
    name        = "elan076c:00-04f3:3245-touchpad",
    sensitivity = 0.6, -- Change this number to test different speeds
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout")) -- pacman -S wlogout

-- hl.bind(mainMod .. " + M", function() hl.dispatch("fullscreen", "1") end)
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("nwg-drawer"), { release = true })

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())


-- Dwindle Specific
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only




-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Uncommon-tips-and-tricks/#per-layout-bindings

--Scrolling Specific
hl.bind("SUPER + R", hl.dsp.layout("colresize +conf"))

-- Master Specific
hl.bind("SUPER + RETURN", hl.dsp.layout("swapwithmaster"))
hl.bind("SUPER + I", hl.dsp.layout("addmaster"))
hl.bind("SUPER + SHIFT + I", hl.dsp.layout("removemaster"))



-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))
--
-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
-- hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Magnification (Native Hyprland)
-- Zoom In (e.g., SUPER + EQUAL)
hl.bind(mainMod .. " + equal", function()
    local currentZoom = hl.get_config("cursor.zoom_factor")
    hl.config({ cursor = { zoom_factor = currentZoom * 1.1 } })
end, { repeating = true, description = "Zoom in" })

-- Zoom Out (e.g., SUPER + MINUS)
hl.bind(mainMod .. " + minus", function()
    local currentZoom = hl.get_config("cursor.zoom_factor")
    hl.config({ cursor = { zoom_factor = math.max(1.0, currentZoom / 1.1) } })
end, { repeating = true, description = "Zoom out" })

-- Reset Zoom (e.g., SUPER + SHIFT + MINUS)
hl.bind(mainMod .. " + SHIFT + minus", function()
    hl.config({ cursor = { zoom_factor = 1.0 } })
end, { description = "Reset zoom" })

-- Requires SwayOSD
-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume 5"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume -5"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("swayosd-client --brightness +5"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("swayosd-client --brightness -5"),                  { locked = true, repeating = true })
hl.bind("XF86Launch8",  hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"),       { locked = true })

-- Screenshot
-- hl.bind("Print",hl.dsp.exec_cmd("flameshot gui"),                  { locked = true, repeating = true })
-- hl.bind("Print",hl.dsp.exec_cmd("hyprshot --clipboard -zm region"),                  { locked = true, repeating = true })
hl.bind("Print",hl.dsp.exec_cmd("hyprshot -o /home/hoshiya4522/Pictures/Screenshots --freeze -m region"),                  { locked = true, repeating = true })

-- STT
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("/home/hoshiya4522/.local/bin/handy.AppImage --toggle-transcription"))

-- TTS
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("/home/hoshiya4522/.config/shell/scripts/read-smart.sh"))

-- Alt Tab (Requires snappy-switcher)
hl.bind("ALT + TAB", hl.dsp.exec_cmd("snappy-switcher next"))
hl.bind("ALT + SHIFT + TAB", hl.dsp.exec_cmd("snappy-switcher prev"))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))


-- SUPER SHIFT N = scrolling (because [N]iri)
-- SUPER SHIFT B = dwindlw (because [B]spwn)
-- SUPER SHIFT M = master (because [M]aster)
-- SUPER SHIFT N = monocle (because mo[N]ocle)
-- SUPER SHIFT P = go thought all the layouts
-- SUPER SHIFT F = monocle (because [F]ullscreen)
-- SUPER M = maximize - togglable (because [m]aximize)
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + N", function () hl.workspace_rule({ workspace = hl.get_active_workspace().name, layout = "scrolling" }) end)
hl.bind(mainMod .. " + SHIFT + K", function () hl.workspace_rule({ workspace = hl.get_active_workspace().name, layout = "monocle" }) end)
hl.bind(mainMod .. " + SHIFT + M", function () hl.workspace_rule({ workspace = hl.get_active_workspace().name, layout = "master" }) end)
hl.bind(mainMod .. " + SHIFT + B", function () hl.workspace_rule({ workspace = hl.get_active_workspace().name, layout = "dwindle" }) end)

--
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Uncommon-tips-and-tricks/#cycle-layout-for-current-workspace
function cycle_layouts()
    local layouts     = { "scrolling", "dwindle", "master", "monocle" }
    local workspace   = hl.get_active_workspace()
    local next_layout = "dwindle"
    if not workspace then
        return
    end
    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + 1
            next_layout = layouts[next_layout_idx]
            break
        end
    end
	local layout_colors = {
		dwindle   = "rgb(33ccff)",
        scrolling = "rgb(00ff99)",
        master    = "rgb(ff9933)",
        monocle   = "rgb(cc66ff)"
    }
	-- hl.notification.create({
	-- 	text = "Layout changed to: " .. next_layout,
	-- 	font_size = 12,
	-- 	color = layout_colors[next_layout],
	-- 	duration = 1500
	-- })
	hl.workspace_rule({ workspace = workspace.name, layout = next_layout })
end

hl.bind(mainMod .. " + SHIFT + P", cycle_layouts)
--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "firefox-pip",
    match = {
        class = "firefox",
        title = "Picture-in-Picture"
    },
    float = true,
	pin = true
})



-- template
-- hl.gesture({ 
-- 	fingers = 4, 
-- 	direction = "up", 
-- 	action = function() hl.exec_cmd("ghostty") end 
-- })

hl.gesture({
    fingers = 3,
    direction = "pinch",
    action = "cursorZoom",
    zoom_level = 1,
    mode = "live"
})


-- Middle Click + Right Click for hexecute (Requires Hexecute, ofc)
-- Gemini made the following code
-- 1. Create the special mode (submap) for the mouse chord
hl.define_submap("mouse_chord", function()
    -- If Right Click (mouse:273) is pressed, run the command and exit the submap
    hl.bind("mouse:274", hl.dsp.exec_cmd("hexecute"))
    hl.bind("mouse:274", hl.dsp.submap("reset"))

    -- If Middle Click (mouse:274) is released without a right click, exit the submap.
    -- We use non_consuming so the app still receives the release click.
    hl.bind("mouse:273", hl.dsp.submap("reset"), { release = true, non_consuming = true })
end)

-- 2. When Middle Click is pressed, enter the submap.
-- We use non_consuming so the click is not blocked from your open apps.
hl.bind("mouse:273", hl.dsp.submap("mouse_chord"), { non_consuming = true })




-- Workspace switching and moving windows
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- Hyprland workspace switching should go overall workspaces in between 
-- Most of the following code was made with Claude
local smoothSwitch = false
local stepDelay    = 100

local function switch_workspace_through(target)
    local current = hl.get_active_workspace().id
    if not smoothSwitch or type(current) ~= "number" or type(target) ~= "number" or current == target then
        hl.dispatch(hl.dsp.focus({ workspace = target }))
        return
    end
    local step = (target > current) and 1 or -1
    local ws = current + step
    local function schedule_next()
        if (step > 0 and ws > target) or (step < 0 and ws < target) then
            return
        end
        local this_ws = ws
        ws = ws + step
        hl.timer(function()
            hl.dispatch(hl.dsp.focus({ workspace = this_ws }))
            schedule_next()
        end, { timeout = stepDelay, type = "oneshot" })
    end
    schedule_next()
end


for i = 1, 10 do
    local key    = i % 10  -- 10 maps to key 0
    local target = i

	if (smoothSwitch) then
		hl.bind(mainMod .. " + " .. key, function()
			switch_workspace_through(target)
		end)
	else
		hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
	end
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow=false }))

end



-- Define how many pixels to move
local moveFloat = 15
-- Move the window relative to its current position
-- 'repeating = true' allows you to hold the keys down to keep moving the window
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ x = -moveFloat, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ x = moveFloat, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ x = 0, y = -moveFloat, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ x = 0, y = moveFloat, relative = true }), { repeating = true })

-- Set how many pixels to resize by
local resizeFloat = 15
-- Resize the window using arrow keys
-- 'relative = true' means it adds or subtracts from the current size
hl.bind("SUPER + CONTROL + K", hl.dsp.window.resize({ x = 0, y = -resizeFloat, relative = true }), { repeating = true })
hl.bind("SUPER + CONTROL + J", hl.dsp.window.resize({ x = 0, y = resizeFloat, relative = true }), { repeating = true })
hl.bind("SUPER + CONTROL + H", hl.dsp.window.resize({ x = -resizeFloat, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CONTROL + L", hl.dsp.window.resize({ x = resizeFloat, y = 0, relative = true }), { repeating = true })

-- Move the floating window to the extreme edges of the screen
hl.bind("SUPER + SHIFT + ALT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + ALT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + ALT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + ALT + L", hl.dsp.window.move({ direction = "r" }))


-- Hyprexpo
-- hyprpm add https://github.com/sandwichfarm/hyprexpo
-- hyprpm enable hyprexpo
-- hyprpm reload
hl.config({
    plugin = {
        hyprexpo = {
            columns = 3,
            gaps_in = 5,
            gaps_out = 0,
            bg_col = "rgb(111111)",
            workspace_method = "center current",
            gesture_distance = 200,
            cancel_key = "escape",
            show_cursor = 1,
        },
    },
})
hl.bind("SUPER + W", function() hl.plugin.hyprexpo.expo("toggle") end)



-- hl.workspace_rule({ workspace = "5", layout = "scrolling" })

require("testing")

