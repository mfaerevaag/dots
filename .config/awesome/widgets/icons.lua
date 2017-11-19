-- ~/.config/awesome/widgets/icons.lua

local wibox = require("wibox")

icons = {}

icons.bubble    = wibox.widget.textbox(" ∘ ")
icons.spacer    = wibox.widget.textbox("  ")
icons.space     = wibox.widget.textbox(" ")
icons.separator = wibox.widget.textbox("] [")
icons.bracketl  = wibox.widget.textbox("[")
icons.bracketr  = wibox.widget.textbox("]")
icons.vertline  = wibox.widget.textbox("|")
icons.dash      = wibox.widget.textbox(" - ")

local icondir = "/usr/share/awesome/themes/lib/icons/"

-- icons.cpu = wibox.widget.imagebox()
-- icons.cpu:fit(3,3) -- ?
-- icons.cpu:set_image(icondir .. 'cpu.png')

-- archicon.bg_align = "middle"
-- archicon.width = 8
-- cpuicon = widget ({ type = "textbox" })
-- cpuicon.bg_image = image(beautiful.icon_cpu)
-- cpuicon.bg_align = "middle"
-- cpuicon.width = 8
-- tempicon = widget ({ type = "textbox" })
-- tempicon.bg_image = image(beautiful.icon_temp)
-- tempicon.bg_align = "middle"
-- tempicon.width = 8
-- memicon = widget ({ type = "textbox" })
-- memicon.bg_image = image(beautiful.icon_mem)
-- memicon.bg_align = "middle"
-- memicon.width = 8
-- spkricon = widget ({ type = "textbox" })
-- spkricon.bg_image = image(beautiful.icon_spkr)
-- spkricon.bg_align = "middle"
-- spkricon.width = 8
-- headicon = widget ({ type = "textbox" })
-- headicon.bg_image = image(beautiful.icon_head)
-- headicon.bg_align = "middle"
-- headicon.width = 8
-- netdnicon = widget ({ type = "textbox" })
-- netdnicon.bg_image = image(beautiful.icon_down)
-- netdnicon.bg_align = "middle"
-- netdnicon.width = 8
-- netupicon = widget ({ type = "textbox" })
-- netupicon.bg_image = image(beautiful.icon_up)
-- netupicon.bg_align = "middle"
-- netupicon.width = 8
-- mailicon = widget ({ type = "textbox" })
-- mailicon.bg_image = image(beautiful.icon_mail)
-- mailicon.bg_align = "middle"
-- mailicon.width = 8
-- pacicon = widget ({ type = "textbox" })
-- pacicon.bg_image = image(beautiful.icon_pac)
-- pacicon.bg_align = "middle"
-- pacicon.width = 8
-- batticon = widget ({ type = "textbox" })
-- batticon.bg_image = image(beautiful.icon_batt_full)
-- batticon.bg_align = "middle"
-- batticon.width = 8
-- clockicon = widget ({ type = "textbox" })
-- clockicon.bg_image = image(beautiful.icon_clock)
-- clockicon.bg_align = "middle"
-- clockicon.width = 8
-- musicicon = widget ({ type = "textbox" })
-- musicicon.bg_image = image(beautiful.icon_music)
-- musicicon.bg_align = "middle"
-- musicicon.width = 8
-- dishicon = widget ({ type = "textbox" })
-- dishicon.bg_image = image(beautiful.icon_dish)
-- dishicon.bg_align = "middle"
-- dishicon.width = 8
-- wifiicon = widget ({ type = "textbox" })
-- wifiicon.bg_image = image(beautiful.icon_wifi)
-- wifiicon.bg_align = "middle"
-- wifiicon.width = 8
-- spkricon = widget ({ type = "textbox" })
-- spkricon.bg_image = image(beautiful.icon_spkr)
-- spkricon.bg_align = "middle"
-- spkricon.width = 8
-- baticon = widget ({ type = "textbox" })
-- baticon.bg_image = image(beautiful.icon_ac)
-- baticon.bg_align = "middle"
-- baticon.width = 8
-- foxicon = widget ({ type = "textbox" })
-- foxicon.bg_image = image(beautiful.icon_fox)
-- foxicon.bg_align = "middle"
-- foxicon.width = 8

return icons
