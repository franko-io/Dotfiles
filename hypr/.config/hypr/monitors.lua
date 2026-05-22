------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

local monitors = {
  {
    output = 'desc:Sharp Corporation 0x14D1',
    mode = 'preferred',
    position = '0x0',
    scale = 1,
    disabled = false,
  },
  {
    output = 'desc:Iiyama North America PLE2483H 1127850724357',
    mode = 'preferred',
    position = '-960x-1080',
    scale = 'auto',
    disabled = false,
  },
  {
    output = 'desc:Samsung Electric Company S24D340 0x5A5A4142',
    mode = 'preferred',
    position = '960x-1080',
    scale = 'auto',
    disabled = false,
  },
  {
    output = 'desc:BNQ BenQ XL2430T ZAF04012SL0',
    mode = 'preferred',
    position = 'auto',
    scale = 'auto',
    disabled = false,
  },
}

for _, val in ipairs(monitors) do
  hl.monitor(val)
end

-- Add a submap for toggling monitors on/off
hl.bind('SUPER + ESCAPE', hl.dsp.submap('toggle-monitors'))
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
