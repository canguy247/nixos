{ config, lib, pkgs, ... }: {

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

}
