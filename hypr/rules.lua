for j = 1, 5 do
	hl.workspace_rule({
		workspace = j,
		persistent = true,
	})
end

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	match = {
		class = "^(org\\.wezfurlong\\.wezterm|gnome-control-center|pavucontrol|nm-connection-editor)$",
	},
	tile = true,
})

hl.window_rule({
	match = {
		class = "^(org\\.gnome\\.Calculator|gnome-calculator|steam|galculator|blueman-manager|xdg-desktop-portal)$",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "^(steam)$",
		title = "^(notificationtoasts)$",
	},
	no_initial_focus = true,
})

hl.window_rule({
	match = {
		class = "^(steam)$",
		title = "^(notificationtoasts)$",
	},
	pin = true,
})

hl.window_rule({
	match = {
		class = ".*vlc.*|.*blender.*|.*steam_app_.*|.*virt-manager.*|.*qemu.*|affinity|.*krita.*",
	},
	opaque = true,
	no_blur = true,
})

hl.window_rule({
	match = {
		class = ".*File.*|.*file.*|PenTablet",
	},
	float = true,
	size = { 700, 500 },
})

hl.layer_rule({
	name = "noctalia",
	match = {

		namespace = "noctalia-background-.*|^noctalia-.*",
	},
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

hl.window_rule({
	match = {
		class = ".*Nautilus.*",
	},
	float = true,
	size = {850, 600},
})
