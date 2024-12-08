{ config, lib, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };

  hardware.pulseaudio.support32Bit = true;
  hardware.steam-hardware.enable = true;

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;

  };

  environment.systemPackages = with pkgs; [
    steam
    steam-run
    glxinfo
    xonotic
    vkquake
    vulkan-tools
    vulkan-loader
    vulkan-headers
    heroic
    lutris
    #wine-staging
    #winePackages.staging
    #wineWowPackages.staging
    #winetricks
    # minecraft
    quakespasm
  ];
}
