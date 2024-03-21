# dotfiles
assortment of config files for things i use, 
and various scripts needed to quickly get a system
ready for use

## settings/commands i find useful but are a pain to lookup

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

ufw config - taken from arch wiki - there are some modifications to make
but currently can't find them
```bash
# ufw default deny
# ufw allow from 192.168.0.0/24
# ufw allow Deluge
# ufw limit ssh
```

more a reminder, since i rarely need to use it, but in vim
a plugin or something will override a default or vimrc option
for something that is super annoying so to see what is changing it do:
```vimscript
set <option> ?
```

particularly, some vim plugin overrides tabstop for ruby so use
```vimscript
:verbose set tabstop sw softtabstop expandtab ?
```
