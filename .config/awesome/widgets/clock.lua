-- ~/.config/awesome/widgets/clock.lua

local awful = require("awful")
local colors = require('colors')
local mywidgets = require('mywidgets')

config = mywidgets.config.clock

colors = colors.zenburn

widget = awful.widget.textclock(
   "<span color='" .. colors.blue[1] .. "'>" .. config.format .. "</span>",
   config.update
)

return widget
