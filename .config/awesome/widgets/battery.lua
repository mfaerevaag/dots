-- ~/.config/awesome/widgets/battery.lua

local wibox = require("wibox")
local naughty = require("naughty")
local colors = require('colors')
local mywidgets = require('mywidgets')

colors = colors.zenburn
config = mywidgets.config.battery


function batteryinfo(adapter, widget)
   local fcap = io.open("/sys/class/power_supply/"..adapter.."/capacity")
   local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")
   local cap = fcap:read()
   local sta = fsta:read()

   cur = cap .. "%"

   if sta:match("Charging") then
      dir = "+"
   elseif sta:match("Discharging") then
      dir = "-"
   else
      dir = "~"
   end

   if tonumber(cap) < 25 then
      color = colors.red[1]
   elseif tonumber(cap) < 50 then
      color = colors.fg[2]
   else
      color = colors.green[1]
   end

   if (tonumber(cap) == 10 or tonumber(cap) == 5) and dir == '-' then
      naughty.notify({ preset = naughty.config.presets.critical,
                       title  = "Low battery!",
                       text   = "Connect your fucking charger." })
   end

   battery = dir .. cur

   widget:set_markup("<span color='" .. color .. "'>" .. battery .. "</span>")

   fcap:close()
   fsta:close()
end


local widget = wibox.widget.textbox()
widget:set_align("right")


battery_timer = timer({timeout = config.update})
battery_timer:connect_signal("timeout", function() batteryinfo("BAT0", widget) end)
battery_timer:start()


batteryinfo("BAT0", widget)


return widget
