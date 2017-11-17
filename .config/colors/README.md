Colors
======

# Spacemacs

Link custom theme into Spacemacs:
```sh
mkdir .emacs.d/private/local/womat-theme
ln -s /home/markus/.config/colors/wombat-theme.el .emacs.d.spacemacs/private/local/womat-theme/
```

Set theme in `.spacemacs`:
```lisp
   dotspacemacs-themes '((wombat :location local))
```
