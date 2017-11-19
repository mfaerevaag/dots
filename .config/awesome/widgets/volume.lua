-- ~/.config/awesome/widgets/volume.lua
-- http://awesome.naquadah.org/wiki/Volume_control_and_display

local wibox = require("wibox")
local awful = require("awful")
local colors = require('colors')
local mywidgets = require('mywidgets')

config = mywidgets.config.volume
colors = colors.zenburn


function updatevolume(widget)
   local fd = io.popen("amixer get Master")
   local status = fd:read("*all")
   fd:close()

   -- local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
   local volume = string.match(status, "(%d?%d?%d)%%")
   -- volume = string.format("% 3d", volume)

   status = string.match(status, "%[(o[^%]]*)%]")

   if string.find(status, "on", 1, true) then
       -- For the volume numbers
       volume = volume .. "%"
   else
       -- For the mute button
       volume = volume .. "<span color='" .. colors.red[1] .. "'>M</span>"
   end

   widget:set_markup('v' .. volume)
end


local widget = wibox.widget.textbox()
widget:set_align("right")

updatevolume(widget)

volumetimer = timer({ timeout = config.update })
volumetimer:connect_signal("timeout", function () updatevolume(widget) end)
volumetimer:start()


return widget
