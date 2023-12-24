{ inputs, lib, pkgs, platform, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    inputs.nixos-hardware.nixosModules.gpd-win-2
  ];

  swapDevices = [{
    device = "/swap";
    size = 2048;
  }];

  boot = {
    initrd.availableKernelModules =
      [ "xhci_pci" "ahci" "usbhid" "usb_storage" "uas" "sd_mod" "sdhci_pci" ];
    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # My GPD Win2 has a US keyboard layout
  console.keyMap = lib.mkForce "us";
  services.kmscon.extraConfig = lib.mkForce ''
    font-size=14
    xkb-layout=us
  '';
  services.xserver.layout = lib.mkForce "us";
  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
