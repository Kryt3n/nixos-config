{ config, pkgs, ... }:{
  home-manager.users.Kryten.wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";

      monitor = [ "eDP-1,2560x1600,auto,1.8" ];
      
      general = {
        gaps_in=4;
        gaps_out=6;
        border_size=2;
        layout="dwindle";
      };
      input = {
        follow_mouse=true;
	touchpad.natural_scroll = true;
      };
      decoration = {
        rounding=15;
        active_opacity=0.7;
        inactive_opacity=0.4;
        fullscreen_opacity=0.8;
        blur={
          enabled=true;
          xray=true;
          new_optimizations=true;
          size=14;
          passes=1;
        };
      };
      bind = [
        "$mod, return, exec, ${pkgs.alacritty}/bin/alacritty"
        "$mod, q, killactive"
        "$mod, e, exit"
        "$mod, l, exec, ${pkgs.hyprlock}/bin/hyprlock"

        "$mod, f, togglefloating"
        "$mod, space, fullscreen"

        "Shift_L, Left, movefocus, l"
        "Shift_L, Right, movefocus, r"
        "Shift_L, Up, movefocus, u"
        "Shift_L, Down, movefocus, d"
        
        "$mod ALT, f, exec, ${pkgs.firefox}/bin/firefox"        
      ];
      exec-once = [
        "${pkgs.alacritty}/bin/alacritty"
        "${pkgs.firefox}/bin/firefox"
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.waybar}/bin/waybar"
      ];
    };
  };
}

