{ config, outputs, pkgs, inputs, lib, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  hardware.ckb-next.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  nixpkgs = { overlays = [ outputs.overlays.unstable-packages ]; };

  # TODO change Electron to the unstable version to get rid of this issue (deprecated version)

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];
  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit

    orca-slicer

    onlyoffice-bin
    vlc
    handbrake
    obsidian
    telegram-desktop
    #  super-slicer
    prusa-slicer
    nextcloud-client
    arduino
    # Hyprland requirements
    dunst
    waybar
    alacritty
    wofi
    foot
    nwg-drawer
    nwg-bar
    pavucontrol
    htop
    mako
    wpaperd
    networkmanagerapplet
    copyq
    wl-clipboard
    font-awesome_5
    syncthingtray

    xdg-desktop-portal-hyprland

    # Not sure this is required anymore
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [{
      from = 1714;
      to = 1764;
    } # KDE Connect
      ];
    allowedUDPPortRanges = [{
      from = 1714;
      to = 1764;
    } # KDE Connect
      ];
  };

  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  programs.kdeconnect.enable = true;

  programs.hyprland.enable = true;
  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

}
