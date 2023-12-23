{ config, lib, pkgs, ... }:

{
  services = {
    syncthing = {
      enable = true;
      user = "methots";
      dataDir = "/home/methots/syncthing";
      configDir = "/home/methots/.config/syncthing";
      overrideDevices =
        true; # overrides any devices added or deleted through the WebUI
      overrideFolders =
        true; # overrides any folders added or deleted through the WebUI
      devices = {
        "Fold4" = {
          id =
            "7KVTCTT-M4TXA3I-2OSDE6Z-YU3QPNB-B55XT2X-CI54BBT-FC4EBAP-37ZOKAY";
        };
        "omvrouter" = {
          id =
            "GXOLNNX-NFQRHSY-KVXR23A-RLRQILE-VOBJIR6-J3NSVFK-XJBAJI5-VYT7ZQU";
        };
      };
      folders = {
        "Public" = { # Name of folder in Syncthing, also the folder ID
          path = "/home/methots/Public"; # Which folder to add to Syncthing
          devices =
            [ "Fold4" "omvrouter" ]; # Which devices to share the folder with
        };
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
