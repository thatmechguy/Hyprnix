local mod = "SUPER"

local closeWindowBind = hl.bind(mod .. " + Q", hl.dsp.window.close())

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("zen"))
hl.bind(mod .. " + SHIFT + T", hl.dsp.exec_cmd("kitty -e btop --force-utf"))
hl.bind(mod .. " +TAB", hl.dsp.focus({ workspace = "previous" }))
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind(mod .. " + C", hl.dsp.window.center())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mod .. " + T", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mod .. " + PERIOD", hl.dsp.exec_cmd("flatpak run xyz.riothedev.emojify"))

-- local ipc = "qs -c noctalia-shell ipc call"

-- hl.bind(mod .. " + D", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))
-- hl.bind(mod .. " + Y", hl.dsp.exec_cmd(ipc .. " wallpaper toggle"))
-- hl.bind(mod .. " + V", hl.dsp.exec_cmd(ipc .. " launcher clipboard"))
-- hl.bind("XF86Launch1", hl.dsp.exec_cmd(ipc .. " powerProfile cycle"))
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. " media playPause"))
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. " media next"))
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume increase"))
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume decrease"))
-- hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume muteOutput"))
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness increase"))
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness decrease"))

-- NOCTALIA v5 BINDS --------------------------------------

local noc = "noctalia msg"

hl.bind(mod .. " + D", hl.dsp.exec_cmd(noc .. " panel-toggle launcher"))
hl.bind(mod .. " + Y", hl.dsp.exec_cmd(noc .. " panel-toggle wallpaper"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noc .. " volume-up 1"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noc .. " volume-down 1"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noc .. " volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noc .. " brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noc .. " brightness-down"))
hl.bind("XF86Launch1", hl.dsp.exec_cmd(noc .. " power-cycle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noc .. " media toggle"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noc .. " media next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noc .. " media previous"))

hl.bind("PRINT", hl.dsp.exec_cmd(noc .. " screenshot-region"))
hl.bind(mod .. " + PRINT",hl.dsp.exec_cmd(noc .. " screenshot-fullscreen"))

-------------------------------------------------

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "l" }), { description = "Swap tiled window left" })
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "r" }), { description = "Swap tiled window right" })
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "u" }), { description = "Swap tiled window up" })
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "d" }), { description = "Swap tiled window down" })

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(ipc .. " lockScreen lock"), { locked = true })

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(noc .. " session lock"), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("powerprofilesctl set balanced"), { locked = true })


hl.bind("SUPER + F12", function()
    local current = hl.get_config("debug.overlay")
    hl.config({ debug = { overlay = not current } })
end)
