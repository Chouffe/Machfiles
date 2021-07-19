# Setup

How to setup a work environment.

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
