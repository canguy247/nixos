
# My NixOS configuration files

## Current status:

- NixOS running all 3 devices listed below
- TODO: migrate server LXC's and VMs to NixOS (NixOPS or Deploy-RS)

## Road map:

- transition from to dotfiles home-manager. In progress, Doom Emacs next on list
- complete hyprland configuration and move into home-manager declaritive setup
  - hyprland config files are now copied over by hm, next step is declaritive (optional)

## Devices:

- GPD Win 2:                         installed
- GPD Win Max 2 (AMD 6800U):         installed
- Desktop (AMD 3600x w/ AMD Vega 56):    installed


## HomeLab:

- LXCs and VMs to be migrated...TODO Add list here


## Notes for post-install of NixOS:

- run doom install
- pull down git bare repository (used until all devices and applicable homelab VMs/LXCs run NixOS)
- mv .bashrc .bashrc.bck
- rm *.el in doom directory
- config checkout
- run doom sync
- check with doom doctor
- open Obsidian and open vault

