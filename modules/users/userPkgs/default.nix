{ config, pkgs, ... }:{
  home-manager.users.Kryten.home.packages = with pkgs; [
    alacritty
    hyprland
    hyprpicker
    hyprpaper
    hyprlock
    swww
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    wofi
    wlroots
    polybar
    git
  ];
  home-manager.users.Kryten.programs = {
    bash.enable = true;
    git.enable = true;
  }; 
}
