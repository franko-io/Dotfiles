------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

local monIiyama = 'desc:Iiyama North America PLE2483H 1127850724357'
local monSamsung = 'desc:Samsung Electric Company S24D340 0x5A5A4142'
local monBenQ = 'desc:BNQ BenQ XL2430T ZAF04012SL0'

hl.monitor({ output = 'eDP-1', mode = 'preferred', position = '0x0', scale = 1 })
hl.monitor({ output = monIiyama, mode = 'preferred', position = '-960x-1080', scale = 'auto' })
hl.monitor({ output = monSamsung, mode = 'preferred', position = '960x-1080', scale = 'auto' })
hl.monitor({ output = monBenQ, mode = 'preferred', position = 'auto', scale = 'auto' })
