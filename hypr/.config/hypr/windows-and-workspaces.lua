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
    title = 'clipse',
  },
  stay_focused = true,
  float = true,
  size = { 'monitor_w*0.65', 'monitor_h*0.65' },
})

hl.window_rule({
  name = 'bluetui',
  match = {
    title = 'bluetui',
  },
  stay_focused = true,
  float = true,
  size = { 'monitor_w*0.5', 'monitor_h*0.5' },
})

hl.window_rule({
  name = 'wiremix',
  match = {
    title = 'wiremix',
  },
  stay_focused = true,
  float = true,
  size = { 'monitor_w*0.5', 'monitor_h*0.5' },
})

hl.window_rule({
  name = 'btop',
  match = {
    title = 'btop',
  },
  float = true,
  size = { 'monitor_w*0.75', 'monitor_h*0.75' },
})

hl.window_rule({
  name = 'nmrs',
  match = {
    class = 'org.nmrs.ui',
  },
  float = true,
  stay_focused = true,
  size = { 'monitor_w*0.5', 'monitor_h*0.5' },
})
