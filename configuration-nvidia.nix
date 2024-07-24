#configuration file for machines with an Nvidia GPU.
{ config, lib, pkgs, inputs, ... }:
{
  system.nixos.tags = [ "Nvidia" ];    
  imports =
    [
      #hardware
      ./hardware-configuration.nix
      #modules
      ./configuration.nix
    ];
  networking.hostName = "nixos-nvidia";  
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelParams = [ "module_blacklist=i915" "module_blacklist=amdgpu" ];
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [nvidia-vaapi-driver intel-media-driver];
      extraPackages32 = with pkgs.pkgsi686Linux; [nvidia-vaapi-driver intel-media-driver];
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # if cursor invisible
    NIXOS_OZONE_WL = "1"; # hint for electron apps to use wayland
  };
}

