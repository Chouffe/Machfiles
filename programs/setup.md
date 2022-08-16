# Setup

How to setup a work environment.

## Configure the yubikey

* [Yubikey Guide](https://github.com/drduh/YubiKey-Guide#debian-and-ubuntu)
* Import the public key
* Run `gpg --card-edit` and trust with ultimate (5)

## Configure pass

* Find the git repo URL and pull the repo from pass

## Privacy

* [Improve your Privacy](https://iotdarwinaward.com/post/improve-your-privacy-in-age-of-mass-surveillance/)
* EFF: HTTPS Everywhere
* uBlock Origin
* Privacy Badger
* DuckDuckGo
* VPN
* [hosts file](https://github.com/StevenBlack/hosts)
* Pi Hole
* Mac Address Randomization: macchanger

## Config

* Remap Caps lock to Control
  * edit /etc/default/keyboard
  * set XKBOPTIONS=“ctrl:nocaps”
* Remap volume keys to volume
* Cursor speed:
  * xset q | grep rate
  * xset r rate 250 40
* Enable the Compose Key by installing gnome-tweak-tool and enabling it
* Setup a compose key for accents

## Editor: nvim

* Install vim-plug
* Install the latest nvim
* Install all plugins with `:PlugInstall`

## Desktop: Regolith

* Install from PPA as a package
* Install i3xrocks-battery status
* Install themes: https://regolith-desktop.com/docs/using-regolith/configuration/
* Install rofi-pass: https://github.com/carnager/rofi-pass

## Change fonts

* Use the Nerdfont repo to download patched fonts: https://github.com/ryanoasis/nerd-fonts
* Follow this guide to set it up in Alacritty: https://www.behova.net/fonts-in-alacritty/
