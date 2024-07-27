## To do:
##  - https://github.com/Frost-Pheonix/nixos-config/blob/main/modules/home/waybar
{ config, lib, pkgs, inputs, ... }:
{    
  imports =
    [
      ./modules/home-manager/default.nix
      ./modules/users/default.nix
      ./modules/packages/default.nix
      ./modules/bootconfig/default.nix
    ];
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
 
  services = {
    libinput.enable = true;
    openssh.enable = true;
    xserver = {
    desktopManager.wallpaper.mode = "fill";
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    pipewire = { 
      enable = true; 
      pulse.enable = true; 
    };
  };

  nixpkgs.config.allowUnfree = true;    
  hardware.bluetooth.enable = true;
  networking.networkmanager.enable = true;
  time.timeZone = "Australia/Brisbane";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    allowed-users = [ "@wheel"];
    trusted-users = [ "@wheel"];
  };

  system.stateVersion = "24.05"; #first ver. of nix used on your machine. Don't change!
}
