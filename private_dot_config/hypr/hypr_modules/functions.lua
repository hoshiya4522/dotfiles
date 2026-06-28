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
	hl.dispatch(hl.dsp.exec_cmd("pkill -RTMIN+8 waybar"))
end

