--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({ name = 'suppress-maximize-events', match = { class = '.*' }, suppress_event = 'maximize' })

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name = 'fix-xwayland-drags',
  match = {
    class = '^$',
    title = '^$',
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
  name = 'move-hyprland-run',
  match = { class = 'hyprland-run' },

  move = '20 monitor_h-120',
  float = true,
})

hl.window_rule({
  name = 'clipse',
  match = {
    class = 'com.example.clipse',
  },
  stay_focused = true,
  float = true,
  size = { 'monitor_w*0.65', 'monitor_h*0.65' },
})
