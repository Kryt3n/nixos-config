
{ config, lib, pkgs, ... }:

{    
  environment.systemPackages = with pkgs; [
    xwayland
    wayland-protocols
    wayland-utils
    wl-clipboard
    pavucontrol
    libva
    libvdpau
    nvidia-vaapi-driver    
    networkmanagerapplet
        
    firefox
    vim
    wget
    mtr
  ];
  programs = {
    xwayland.enable = true; 
    hyprland.enable = true;
    hyprland.xwayland.enable = true;
    ## gdm does not work if not included here, even thought hypr 
    ## settings are in "../users/directory". Possible cause is that 
    ## global configuration pkgs are not imported into user dir,
    ## meaning gdm not accessed? I am fine with this for now.
  };
}
