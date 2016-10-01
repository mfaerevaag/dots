-- .dotfile
-- xmonad/xmonad.hs

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName

-- modkey
myModMask = mod4Mask

-- emulator
myTerminal = "urxvt"

--
myNormalBorderColor  = "#444444"
myFocusedBorderColor = "#e5786d" --"#5283d7"

-- startup hook
--myStartupHook = setWMName "LG3D"



-- run xmonad
main = xmonad =<< xmobar defaults

-- with custom defaults
defaults = defaultConfig {
  modMask       = myModMask
  , terminal    = myTerminal
  , normalBorderColor  = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor
--  , startupHook = myStartupHook
  }
