---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout = 'us',
    kb_variant = '',
    kb_model = '',
    kb_options = '',
    kb_rules = '',

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.25,
    },
  },
  cursor = {
    inactive_timeout = 3,
  },
})

hl.gesture({ fingers = 3, direction = 'horizontal', action = 'workspace' })
hl.gesture({ fingers = 3, direction = 'down', action = 'close' })
hl.gesture({ fingers = 3, direction = 'up', scale = 1.5, action = 'fullscreen' })
