#!/bin/bash
dconf write /org/gnome/desktop/wm/keybindings/close "['<Alt>k']";

dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-1 "['<Shift><Alt>exclam']";
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-2 "['<Shift><Alt>quotedbl']";
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-3 "['<Shift><Alt>sterling']";
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-4 "['<Shift><Alt>4']";
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-5 "['<Shift><Alt>5']";
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-6 "['<Shift><Alt>6']";

dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "['<Alt>1']";
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "['<Alt>2']";
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "['<Alt>3']";
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "['<Alt>4']";
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-5 "['<Alt>5']";
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-6 "['<Alt>6']";

dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,maximize,close'";
dconf write /org/gnome/desktop/wm/preferences/focus-mode "'sloppy'";
dconf write /org/gnome/desktop/wm/preferences/num-workspaces "6";

dconf write /org/gnome/desktop/interface/clock-show-seconds "true"
dconf write /org/gnome/desktop/interface/clock-show-weekday "true"
