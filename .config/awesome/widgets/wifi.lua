-- ~/.config/awesome/widgets/wifi.lua
-- cheers gpix13
-- github.com/gpix13/awesome-wm/blob/master/vicious/widgets/wifi.lua

local wibox = require("wibox")
local helpers = require("vicious.helpers")
local colors = require('colors')
local mywidgets = require('mywidgets')

config = mywidgets.config.wifi
colors = colors.zenburn


function wifiinfo(nic, widget)
   local fiw = io.popen("iwconfig")
   local iw = fiw:read("*all")
   fiw:close()

   -- return if unaveliable
   if iw == nil or string.find(iw, "No such device") then
      widget:set_markup("<span color='red'>Err</span>")
      return
   end

   -- default values
   local default = "N/A"
   local winfo = {
      ["{ssid}"] = default,
      ["{mode}"] = default,
      ["{chan}"] = 0,
      ["{rate}"] = 0,
      ["{link}"] = 0,
      ["{linp}"] = 0,
      ["{sign}"] = 0
   }

   -- SSID can have almost anything in it
   winfo["{ssid}"] = helpers.escape(string.match(iw, 'ESSID[=:]\"(.-)\"') or winfo["{ssid}"])
   -- Link quality can contain a slash (32/70), match only the first number
   winfo["{link}"] = tonumber(string.match(iw, "Link Quality[=:]([%d]+)") or winfo["{link}"])
   -- -- Modes are simple, but also match the "-" in Ad-Hoc
   -- winfo["{mode}"] = string.match(iw, "Mode[=:]([%w%-]*)") or winfo["{mode}"]
   -- -- Channels are plain digits
   -- winfo["{chan}"] = tonumber(string.match(iw, "Channel[=:]([%d]+)") or winfo["{chan}"])
   -- -- Bitrate can start with a space, we don't want to display Mb/s
   -- winfo["{rate}"] = tonumber(string.match(iw, "Bit Rate[=:]([%s]?[%d%.]*)") or winfo["{rate}"])
   -- -- Signal level can be a negative value, don't display decibel notation
   -- winfo["{sign}"] = tonumber(string.match(iw, "Signal level[=:]([%-]?[%d]+)") or winfo["{sign}"])

   -- Link quality percentage if quality was available
   if winfo["{link}"] ~= 0 then winfo["{linp}"] = math.ceil(winfo["{link}"] / 0.7) end

   -- return if not connected
   if string.match(winfo["{ssid}"], "off/any") then
      widget:set_markup("<span color='red'>N/A</span>")
      return
   end

   -- set color and text
   local color = ""
   local text = ""
   if string.match(winfo["{ssid}"], default) then
      color = colors.red[1]
      text = default
   else
      if tonumber(winfo["{linp}"]) >= 50 then
         color = colors.green[1]
      else
         color = colors.fg[2]
      end

      text = winfo["{ssid}"] .. " " .. winfo["{linp}"] .. "%"
   end

   widget:set_markup("<span color='" .. color .. "'>" .. text .. "</span>")
end



local widget = wibox.widget.textbox()
widget:set_align("right")

battery_timer = timer({timeout = config.update})
battery_timer:connect_signal("timeout", function() wifiinfo(config.nic, widget) end)
battery_timer:start()

wifiinfo(config.nic, widget)


return widget
