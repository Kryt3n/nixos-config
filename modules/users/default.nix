{ config, lib, inputs, ... }:{
  imports = 
  [ 
    ./userPkgs/default.nix 
    ./hyprlandSettings/default.nix
    ../home-manager/default.nix
  ];

  users.users = {
    Kryten = {
      isNormalUser = true;
      home         = "/home/Kryten";   
      extraGroups  = [ "wheel" "networkmanager" "video" ];
    };
  };

  home-manager.users.Kryten = {pkgs, ...}: {
    home.username      = "Kryten"; 
    home.homeDirectory = "/home/Kryten";  
    home.stateVersion  = "24.05";
    
    programs.git.userName    = "Kryten";
    programs.git.userEmail   = "jmburn755@gmail.com";
    programs.git.extraConfig = { 
      init.defaultBranch = "main"; 
      safe.directory     = "/etc/nixos";
    };
   
    xsession.enable = true;
    ## xsession.windowManager.command = "...";    
    ## No fkn clue what this (^^^) is or how to implement. 
    ## Home manager guide says to use it.
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.xwayland.enable = true;
    
    services.hyprpaper.enable = true;
    services.hyprpaper.settings = { 
      preload = [ "~/wallpaper.jpg" ];
      wallpaper = [ "eDP-1,~/wallpaper.jpg" ]; 
    };
  };
} 
