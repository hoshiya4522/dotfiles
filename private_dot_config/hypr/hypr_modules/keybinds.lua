-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout")) -- pacman -S wlogout







-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Uncommon-tips-and-tricks/#per-layout-bindings

-- Dwindle Specific
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    

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
-- SUPER SHIFT B = dwindle (because [B]spwn)
-- SUPER SHIFT M = master (because [M]aster)
-- SUPER SHIFT V = monocle (because idk[V])
-- SUPER SHIFT P = go thought all the layouts
-- SUPER SHIFT F = monocle (because [F]ullscreen)
-- SUPER M = maximize - togglable (because [m]aximize)
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mainMod .. " + SHIFT + N", function () 
	hl.workspace_rule({ workspace = hl.get_active_workspace().name, layout = "scrolling" }) 
	hl.dispatch(hl.dsp.exec_cmd("pkill -RTMIN+8 waybar"))
end)

hl.bind(mainMod .. " + SHIFT + V", function () 
	hl.workspace_rule({ workspace = hl.get_active_workspace().name, layout = "monocle" })
	hl.dispatch(hl.dsp.exec_cmd("pkill -RTMIN+8 waybar"))
end)

hl.bind(mainMod .. " + SHIFT + M", function ()
	hl.workspace_rule({ workspace = hl.get_active_workspace().name, layout = "master" })
	hl.dispatch(hl.dsp.exec_cmd("pkill -RTMIN+8 waybar"))
end)

hl.bind(mainMod .. " + SHIFT + B", function ()
	hl.workspace_rule({ workspace = hl.get_active_workspace().name, layout = "dwindle" })
	hl.dispatch(hl.dsp.exec_cmd("pkill -RTMIN+8 waybar"))
end)



-- Custom Function
hl.bind(mainMod .. " + SHIFT + P", cycle_layouts)









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


