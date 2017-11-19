-- ~/.config/awesome/mywidgets.lua

mywidgets = {}

mywidgets.widgets = {
   "cpu",
   "ram",
   "wifi",
   "volume",
   "clock",
   "battery"
}

mywidgets.config = {
   ram = {
      format = "$1%",
      udpate = 13
   },
   wifi = {
      nic = "wlan0",
      update = 5
   },
   volume = {
      update = 0.5
   },
   clock = {
      format = "%d/%m %H:%M:%S",
      update = 1
   },
   battery = {
      update = 30
   }
}

return mywidgets
