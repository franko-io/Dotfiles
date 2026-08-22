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
    position = '0x-1080',
    scale = 'auto',
    disabled = false,
  },
  {
    output = 'desc:Dell Inc. DELL U2715H GH85D88719SL',
    mode = 'preferred',
    position = '-320x-1440',
    scale = 'auto',
    disabled = false,
  },
}

for _, val in ipairs(monitors) do
  hl.monitor(val)
end

return monitors
