require('monitors')
require('autostart')
require('input')
require('env-vars')
require('keybinds')
require('look-and-feel')
require('windows-and-workspaces')

----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    force_default_wallpaper = 1,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    focus_on_activate = false,
    on_focus_under_fullscreen = 1,
  },

  binds = {
    hide_special_on_workspace_change = true,
  },
})
