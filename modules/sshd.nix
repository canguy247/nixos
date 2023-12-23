{ config, lib, pkgs, ... }:

{
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowPing = true;

  users.users.wil.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8V0KUM+B+/sJv66cWqMQdphNb1mk2lhmrZTOzPW4m1"
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBcGfcKt+2+gIWNVL/Royh+l/0M8aAXTk6wu0zYyfqWx"
  ];

}
