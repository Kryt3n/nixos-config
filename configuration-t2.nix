#configuration file for nixos on T2 Macbook Pro
{ config, lib, pkgs, inputs, ... }:
{
  system.nixos.tags = [ "Apple_" ];    
  networking.hostName = "nixos-t2";
  imports =
    [
      #modules
      ./configuration.nix
      ./modules/derivations/derivation-t2.nix
      ./hardware-configuration-t2.nix
      #inputs
      inputs.nixos-hardware.nixosModules.apple-t2
    ];
}
