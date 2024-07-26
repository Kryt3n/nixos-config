{ config, pkgs, ... }:{
  nixpkgs.config.allowUnfreePredicate = _: true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
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
    waybar
 
    git
    vim 
  ];
  home-manager.users.Kryten.programs = {
    bash.enable = true;

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };

    git.enable = true;
    vscode = {
      enable = true;
      package = pkgs.vscodium.fhs;
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        bbenoist.nix
      ];
    };

  }; 
}
