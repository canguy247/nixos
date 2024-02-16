{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-nixosWinMax2.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixosWinMax2"; # Define your hostname.
  #networking.wireless.enable =
  # true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  systemd.services.xr-linux-driver = {
    enable = true;
    description = "xr-linux-driver";
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      Environment = "HOME=/home/methots";
      ExecStart =
        #"/nix/store/j3rf49f3b06cni2ynyrz94alqmhp6z3d-xr-linux-driver-0.6.1-beta/bin/xrealAirLinuxDriver";
        #"/home/methots/NixBuilds/XRDriver/result/bin/xrealAirLinuxDriver";
        "/nix/store/v0ah4vnqcvkr79zgzv6qhg3hy0q26kq3-xr-linux-driver-0.6.1-beta/bin/xrealAirLinuxDriver";
      Restart = "on-failure";
      PrivateNetwork = "true";
      # PrivateTmp = "true";
    };

    wantedBy = [ "multi-user.target" ];
  };

  boot.kernelModules = [ "uinput" ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ brightnessctl ];

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
