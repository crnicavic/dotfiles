# dotfiles
some command/settings that don't fit into a file but i need

map capslock to escape on gnome(might work on wayland idk):
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

map casplock to escape on xorg:
setxkbmap -option caps:escape
