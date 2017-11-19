-- ~/.config.awesome/widgets/ram.lua

local wibox = require('wibox')
local vicious = require('vicious')
local mywidgets = require('mywidgets')

config = mywidgets.config.ram

widget = wibox.widget.textbox()
vicious.register(widget, vicious.widgets.mem, config.format, config.update)

return widget
