hl.on("hyprland.start", function()
	-- hl.exec_cmd("dbus-update-activation-environment --all")
-- 	hl.exec_cmd("qs -c noctalia-shell")
	hl.exec_cmd("noctalia")
	-- hl.exec_cmd("udiskie")
	-- hl.exec_cmd("systemctl --user start hyprland-session.target")
	-- hl.exec_cmd("/usr/libexec/xdg-desktop-portal &")
	-- hl.exec_cmd("sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

------- PIKA OS ----------


-- hl.on("hyprland.start", function()
-- 	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
-- 	hl.exec_cmd("dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY")
-- 	hl.exec_cmd("systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
-- 	hl.exec_cmd("pikman-update-manager-autostart")
-- 	hl.exec_cmd("dconf write /org/gnome/desktop/interface/cursor-size 24")
-- 	hl.exec_cmd("gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty")
-- 	hl.exec_cmd("noctalia")
-- 	hl.exec_cmd("udiskie")
-- 	-- hl.exec_cmd("")
-- end)

-- hl.on("hyprland.shutdown", function()
	-- os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
-- end)
