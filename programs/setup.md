# Setup

How to setup a work environment.

## Configure the yubikey

* [Yubikey Guide](https://github.com/drduh/YubiKey-Guide#debian-and-ubuntu)
* Import the public key
* Do not forget to use card-edit and trust to ultimate

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

## Editor: nvim

* Install vim-plug
* Install all plugins with `:PlugInstall`
