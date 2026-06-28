-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function () 
	-- Necessary for KDE applications to work properly
	hl.exec_cmd("kded6")
	hl.exec_cmd("kbuildsycoca6")

	hl.exec_cmd("waybar") -- bar

	hl.exec_cmd("swayosd-server") -- OSD 
	hl.exec_cmd("swaync") -- notification center

	-- Clipboard (requires cliphist)
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Alt Tab (Requires snappy-switcher)
	hl.exec_cmd("snappy-switcher --daemon")

	-- Hotcorners (Requires waycorner)
	hl.exec_cmd("waycorner")

	-- nwg-look themes load
	hl.exec_cmd("nwg-look -a")
end)


