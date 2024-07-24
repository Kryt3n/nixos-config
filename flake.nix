{
  description = "Flake for multiple machines";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, ... } @ inputs:

  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};    

  in {
    nixosConfigurations = {
      nixos-t2 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./configuration-t2.nix
          home-manager.nixosModules.home-manager
          {home-manager.extraSpecialArgs = { inherit inputs;}; }
          {home-manager.users.Kryten.imports = [ ];}
          nixos-hardware.nixosModules.apple-t2
        ];
      };
      nixos-nvidia = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./configuration-nvidia.nix
          home-manager.nixosModules.home-manager
          {home-manager.extraSpecialArgs = { inherit inputs;}; }
          {home-manager.users.Kryten.imports = [ ];}
        ];
      };
    };
  }; 
}

