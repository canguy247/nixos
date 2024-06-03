{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      l = "eza -lah ";
      ll = "eza -l ";
      la = "eza -la ";
      cat = "bat --paging=never ";
      ".." = "cd ..";
      config =
        "/home/methots/.nix-profile/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME";
      # ec = ''
      #   cd /home/methots/.dotfiles
      #   emacs -nw
      # '';
      nrs = ''
        pushd ~/.dotfiles
        sudo nixos-rebuild switch --flake .
        popd
      '';
      hmr = ''
        pushd ~/.dotfiles
        home-manager switch --flake .
        popd
      '';
    };
    initExtra = ''
      "neofetch"
      ec () {
        cd /home/methots/.dotfiles
        if [ "$#" -eq 0  ]
        then
          emacs -nw
        else
          emacs -nw "$1"
        fi
      }
      e () {
        if [ "$#" -eq 0  ]
        then
          emacs -nw
        else
          emacs -nw "$1"
        fi
      }
      si () {
        neofetch
        echo "---Memory Usage:"
        /run/current-system/sw/bin/free -h

        echo "---Disk Usage:"
        /run/current-system/sw/bin/df -h /dev/disk/by-uuid/* 2>/dev/null

        echo "---Current Uptime:"
        /run/current-system/sw/bin/uptime
      }
    '';

  };

}
