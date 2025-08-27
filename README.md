# Omarchy dotfiles

> base configuration files

## Screenshot

![screenshot](screenshot.png)

## Install

I use GNU Stow [https://www.gnu.org/software/stow](https://www.gnu.org/software/stow)

```shell
cd $HOME
git clone https://github.com/ctarx/my-dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow hypr && stow bashrc
```

## Post Install

- [Starship prompt](https://starship.rs/)

- copy 2-gruvbox.jpg

```shell
cp ~/.dotfiles/backgrounds/2-gruvbox.jpg ~/.config/omarchy/themes/gruvbox/backgrounds/2-gruvbox.jpg
```

- Brave Browser

```shell
yay -Sy brave-bin
```

- [yt-dlp](https://github.com/yt-dlp/yt-dlp/wiki/Installation)

- gvfs-dnssd - DNS-SD and WebDAV

```shell
yay -Sy gvfs-dnssd
```

### Contact

Created by [@ctarx](https://linuxrocks.online/@ctarx) - feel free to contact me!
