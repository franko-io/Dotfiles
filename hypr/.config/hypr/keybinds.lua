--------------------
---- KEYBINDINGS ----
---------------------

-- Mod keys
local mainMod = 'SUPER'
local shiftMod = 'SHIFT + SUPER'

-- My programs
local terminal = 'ghostty'
local fileManager = 'nautilus'
local menu = 'wofi --show drun'
local browser = 'helium-browser'

-- See https://wiki.hypr.land/Configuring/Basics/Binds/

-- My programs
hl.bind(mainMod .. ' + RETURN', hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. ' + E', hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. ' + D', hl.dsp.exec_cmd(menu))
hl.bind(shiftMod .. ' + D', hl.dsp.exec_cmd('wofi-emoji'))
hl.bind(shiftMod .. ' + E', hl.dsp.exec_cmd('~/.config/wofi/power_option/powermenu.sh'))
hl.bind(mainMod .. ' + B', hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. ' + C', hl.dsp.exec_cmd(terminal .. ' --class=com.example.clipse -e clipse'))

-- Hyprshot, see https://github.com/Gustash/Hyprshot
hl.bind(mainMod .. ' + PRINT', hl.dsp.exec_cmd('hyprshot -m window')) -- screenshot a window
hl.bind('PRINT', hl.dsp.exec_cmd('hyprshot -m output')) -- screenshot a monitor
hl.bind(shiftMod .. ' + PRINT', hl.dsp.exec_cmd('hyprshot -m region')) -- screenshot a region
-- Save hyprshot to clipboard
hl.bind(mainMod .. ' + CONTROL + PRINT', hl.dsp.exec_cmd('hyprshot -m window --clipboard-only'))
hl.bind('CONTROL + PRINT', hl.dsp.exec_cmd('hyprshot -m output --clipboard-only'))
hl.bind(shiftMod .. ' + CONTROL + PRINT', hl.dsp.exec_cmd('hyprshot -m region --clipboard-only'))

hl.bind(mainMod .. ' + Q', hl.dsp.window.close())
hl.bind(mainMod .. ' + SHIFT + Q', hl.dsp.window.kill())
hl.bind(mainMod .. ' + F', hl.dsp.window.fullscreen())
hl.bind(mainMod .. ' + V', hl.dsp.window.float({ action = 'toggle' }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. ' + S', hl.dsp.workspace.toggle_special('magic'))
hl.bind(mainMod .. ' + SHIFT + S', hl.dsp.window.move({ workspace = 'special:magic' }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. ' + left', hl.dsp.focus({ direction = 'left' }))
hl.bind(mainMod .. ' + right', hl.dsp.focus({ direction = 'right' }))
hl.bind(mainMod .. ' + up', hl.dsp.focus({ direction = 'up' }))
hl.bind(mainMod .. ' + down', hl.dsp.focus({ direction = 'down' }))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. ' + H', hl.dsp.focus({ direction = 'left' }))
hl.bind(mainMod .. ' + L', hl.dsp.focus({ direction = 'right' }))
hl.bind(mainMod .. ' + K', hl.dsp.focus({ direction = 'up' }))
hl.bind(mainMod .. ' + J', hl.dsp.focus({ direction = 'down' }))

-- Move window with shiftMod + arrow keys
hl.bind(shiftMod .. ' + left', hl.dsp.window.move({ direction = 'left' }))
hl.bind(shiftMod .. ' + right', hl.dsp.window.move({ direction = 'right' }))
hl.bind(shiftMod .. ' + up', hl.dsp.window.move({ direction = 'up' }))
hl.bind(shiftMod .. ' + down', hl.dsp.window.move({ direction = 'down' }))

-- Move window with shiftMod + vim keys
hl.bind(shiftMod .. ' + H', hl.dsp.window.move({ direction = 'left' }))
hl.bind(shiftMod .. ' + L', hl.dsp.window.move({ direction = 'right' }))
hl.bind(shiftMod .. ' + K', hl.dsp.window.move({ direction = 'up' }))
hl.bind(shiftMod .. ' + J', hl.dsp.window.move({ direction = 'down' }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. ' + mouse_down', hl.dsp.focus({ workspace = 'e+1' }))
hl.bind(mainMod .. ' + mouse_up', hl.dsp.focus({ workspace = 'e-1' }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(shiftMod .. ' + mouse:272', hl.dsp.window.resize(), { mouse = true })

-- Add a submap for resizing windows
hl.bind(mainMod .. ' + BACKSLASH', hl.dsp.submap('resize'))
hl.define_submap('resize', function()
  hl.bind('L', hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
  hl.bind('H', hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
  hl.bind('K', hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
  hl.bind('J', hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })

  hl.bind('escape', hl.dsp.submap('reset')) -- exit submap
end)

-- Keybinds further down will be global again...

-- Multimedia keys
-- stylua: ignore start
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { locked = false, repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { locked = false, repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'), { locked = false, repeating = true })
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'), { locked = false, repeating = true })
hl.bind(mainMod .. ' + XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'), { locked = false, repeating = true })

hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%+'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%-'), { locked = true, repeating = true })
-- stylua: ignore end

hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'), { locked = false })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd('playerctl play-pause'), { locked = false })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl play-pause'), { locked = false })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl previous'), { locked = false })
hl.bind(mainMod .. ' + XF86AudioRaiseVolume', hl.dsp.exec_cmd('playerctl next'), { locked = false })
hl.bind(mainMod .. ' + XF86AudioLowerVolume', hl.dsp.exec_cmd('playerctl previous'), { locked = false })

hl.bind('SHIFT + XF86AudioNext', hl.dsp.exec_cmd('playerctl position 10+'), { locked = false })
hl.bind('SHIFT + XF86AudioPrev', hl.dsp.exec_cmd('playerctl position 10-'), { locked = false })
hl.bind(shiftMod .. ' + XF86AudioRaiseVolume', hl.dsp.exec_cmd('playerctl position 10+'), { locked = false })
hl.bind(shiftMod .. ' + XF86AudioLowerVolume', hl.dsp.exec_cmd('playerctl position 10-'), { locked = false })

-- Add a submap for toggling monitors on/off
local monitors = require('monitors')
hl.bind(mainMod .. ' + ESCAPE', hl.dsp.submap('toggle-monitors'))
hl.define_submap('toggle-monitors', function()
  for key, val in ipairs(monitors) do
    hl.bind(tostring(key), function()
      val.disabled = not val.disabled
      hl.monitor(val)
      hl.dispatch((hl.dsp.submap('reset')))
    end)
  end

  hl.bind('escape', hl.dsp.submap('reset')) -- exit submap
end)
