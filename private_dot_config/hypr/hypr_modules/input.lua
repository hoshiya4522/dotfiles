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


