{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "methots";
  home.homeDirectory = "/home/methots";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Hackie fix for Obsidian
  home.sessionVariables = rec {
    LD_LIBRARY_PATH =
      "$(nix build --print-out-paths --no-link nixpkgs#libGL)/lib";
  };

  #  imports = [ ./syncthingHome.nix ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    pkgs.git
    pkgs.nixfmt

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Heya, ${config.home.username}!"
    '')
    # This is needed for our hyprland.conf
    (pkgs.writeShellScriptBin "setHostname" ''
      echo "\$hostname" = $HOSTNAME > ~/hostname.conf
    '')

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/hypr/hyprland.conf".source = dotfiles/hyprland.conf;
    ".config/hypr/monitor-nixosWin2.conf".source =
      dotfiles/monitor-nixosWin2.conf;
    ".config/hypr/monitor-nixosWinMax2.conf".source =
      dotfiles/monitor-nixosWinMax2.conf;
    ".config/hypr/monitor-nixosDesktop.conf".source =
      dotfiles/monitor-nixosDesktop.conf;
    ".config/hypr/monitor-nixosBenchtop.conf".source =
      dotfiles/monitor-nixosBenchtop.conf;

    ".config/alacritty/alacritty.toml".source = dotfiles/alacritty.toml;

    ".config/doom/config.el".source = dotfiles/config.el;
    ".config/doom/init.el".source = dotfiles/init.el;
    ".config/doom/packages.el".source = dotfiles/packages.el;

    ".config/hypr/scripts/lock.sh".source = dotfiles/lock.sh;
    ".config/hypr/scripts/sleep.sh".source = dotfiles/sleep.sh;

    ".config/nwg-bar/bar.json".source = dotfiles/bar.json;
    ".config/nwg-bar/style.css".source = dotfiles/style.css;

    ".config/waybar/config".source = dotfiles/waybar/config;
    ".config/waybar/style.css".source = dotfiles/waybar/style.css;
    ".config/waybar/scripts/OCV".source = dotfiles/waybar/scripts/OCV;
    ".config/waybar/scripts/backlight-hint.sh".source =
      dotfiles/waybar/scripts/backlight-hint.sh;
    ".config/waybar/scripts/check_updates.sh".source =
      dotfiles/waybar/scripts/check_updates.sh;
    ".config/waybar/scripts/cleanup_after_start.sh".source =
      dotfiles/waybar/scripts/cleanup_after_start.sh;
    ".config/waybar/scripts/keyhint.sh".source =
      dotfiles/waybar/scripts/keyhint.sh;
    ".config/waybar/scripts/network_traffic.sh".source =
      dotfiles/waybar/scripts/network_traffic.sh;

    ".config/wpaperd/wallpaper.toml".source = dotfiles/wallpaper.toml;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    #"hostname3.conf".text = ''
    #  $hostname = ${builtins.getHostName}
    #'';

  };
  #
  #  # Home Manager can also manage your environment variables through
  #  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  #  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/methots/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "emacs"; };

  programs.gitui = { enable = true; };

  programs.git = {
    enable = true;
    userName = "Sean Methot";
    userEmail = "seanmethot@gmail.com";

  };

  programs.bash = {
    enable = true;
    shellAliases = {
      l = "eza -lah ";
      ll = "eza -l ";
      la = "eza -la ";
      cat = "bat --paging=never ";
      ".." = "cd ..";
      cfgui = "gitui -d /home/methots/.cfg/ -w ~/";
      config =
        "/home/methots/.nix-profile/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME";
      e = "emacs -nw ";
      ec = ''
        cd /home/methots/.dotfiles
        emacs -nw
      '';
    };
  };

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  services.kanshi = {
    enable = true;
    # systemdTarget = "hyprland-session-target";
    systemdTarget = "";
    profiles = {
      undocked = {
        outputs = [{
          criteria = "Japan Display Inc. GPD1001H 0x00000001";
          scale = 2.0;
          status = "enable";
        }];
      };
      desktopDockWM2 = {
        outputs = [
          {
            criteria = "Japan Display Inc. GPD1001H 0x00000001";
            status = "disable";
          }
          {
            criteria = "Acer Technologies Acer ET322QR 0x91903CC3";
            position = "0,0";
            scale = 1.0;
            status = "enable";
            mode = "1920x1080@60Hz";
          }
          {
            criteria = "LG Electronics LG TV 0x01010101";
            position = "1920,0";
            scale = 1.0;
            status = "enable";
            mode = "1920x1080@60Hz";
          }
        ];
      };
      xReal = {
        outputs = [
          {
            criteria = "Japan Display Inc. GPD1001H 0x00000001";
            status = "disable";
          }
          {
            criteria = "Nreal Air 0x66666600";
            scale = 1.0;
            status = "enable";
          }
        ];
      };

    };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
