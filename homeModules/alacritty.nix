{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = rec {
      opacity = 0.9;
      draw_bold_text_with_bright_colors = true;
      font.size = 9.5;
      colors = {
        # Default colors
        primary = {
          background = "#000000";
          foreground = "#c5c8c6";
        };

        # Colors the cursor will use if `custom_cursor_colors` is true
        cursor = {
          text = "#1d1f21";
          cursor = "#ffffff";
        };

        # Normal colors
        normal = {
          black = "#1d1f21";
          red = "#cc6666";
          green = "#b5bd68";
          yellow = "#e6c547";
          blue = "#81a2be";
          magenta = "#b294bb";
          cyan = "#70c0ba";
          white = "#373b41";
        };

        # Bright colors
        bright = {
          black = "#aaaaaa";
          red = "#ff3334";
          green = "#9ec400";
          yellow = "#f0c674";
          blue = "#81a2be";
          magenta = "#b77ee0";
          cyan = "#54ced6";
          white = "#282a2e";
        };
      };
    };
  };

}
