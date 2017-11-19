-- ~/.config/awesome/widgets/cpu.lua

local wibox = require("wibox")
local vicious = require("vicious")

widget = wibox.widget.textbox()
vicious.register(widget, vicious.widgets.cpu, "$1%")

return widget
