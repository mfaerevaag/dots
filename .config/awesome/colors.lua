-- ~/.config/awesome/widgets/colors.lua

local beautiful = require('beautiful')


colors = {
   zenburn = {
      fg = {
         beautiful.fg_normal,
         beautiful.fg_focus,
         beautiful.fg_urgent
      },
      bg = {
         beautiful.bg_normal,
         beautiful.bg_focus,
         beautiful.bg_urgent
      },
      green = {
         "#88A175",
         "#AECF96"
      },
      red = {
         "#CC9393",
         "#FF5656"
      },
      grey = {
         "#494B4F",
         "#6F6F6F"
      },
      blue = {
         "#6f99b4",
         "#94bff3"
      }
   }
}


return colors
