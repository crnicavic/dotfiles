# dotfiles
assortment of config files for things i use, 
and various scripts needed to quickly get a system
ready for use

## some command/settings that don't fit into a file but i need

map capslock to escape on gnome(might work on wayland idk):
```bash
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
```
map casplock to escape on xorg:
```bash
setxkbmap -option caps:escape
```
vimplug install
```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
