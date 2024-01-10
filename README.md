
# My NixOS configuration files

## Current status:

- early config (~2 weeks in as of 08JAN2024)
- running on the first 2 devices listed below, the remaining to follow

## Road map:

- transition from to dotfiles home-manager as more devices added (I do not want to edit 2 copies)
- complete hyprland configuration and move into home-manager declaritive setup
- install on desktop
    -add olamma

## Devices:

- GPD Win 2:                         installed
- GPD Win Max 2 (AMD 6800U):         installed
- Desktop (AMD 3600x GTX 1660ti):    to be installed


## HomeLab:

- LXCs and VMs to be migrated...TODO Add list here


## Notes for post-install of NixOS:

- run doom install
- pull down git bare repository (used until all devices and applicable homelab VMs/LXCs run NixOS)
- mv .bashrc .bashrc.bck
- rm *.el in doom directory
- config checkout
- mv .bashrc.bck .bashrc (if required)
- run doom sync
- check with doom doctor
- open Obsidian and open vault

