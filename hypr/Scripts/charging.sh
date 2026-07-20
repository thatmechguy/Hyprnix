hyprctl eval 'hl.config({ decoration = { blur = { enabled = 1 } } })'
hyprctl eval 'hl.config({ decoration = { shadow = { enabled = 0 } } })'
hyprctl eval 'hl.config({ decoration = { active_opacity = 0.85 } })'
hyprctl eval 'hl.config({ decoration = { inactive_opacity = 0.85 } })'
hyprctl eval 'hl.config({ animations = { enabled = true } })'

powerprofilesctl set balanced
