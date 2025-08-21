# Inspiration:
#
# - https://github.com/AlexNabokikh/nix-config
# - https://github.com/dustinlyons/nixos-config
{
  description = "Configuration for @nevir's machines";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      home-manager,
      ...
    }:
    let
      lib = nixpkgs.lib;

      hostIds = [ "personal-mbp" ];
      hosts = builtins.map (id: { inherit id; } // (import ./hosts/${id})) hostIds;
      platforms = lib.unique (builtins.catAttrs "platform" hosts);

      scriptNames = [
        "activate"
        "dev"
      ];
      scripts = lib.genAttrs scriptNames (script: {
        type = "app";
        program = "${self}/scripts/${script}";
      });
    in
    {
      darwinConfigurations = lib.genAttrs hostIds (
        hostId:
        darwin.lib.darwinSystem (
          let
            host = lib.findFirst (h: h.id == hostId) null hosts;
          in
          {
            specialArgs = {
              inherit inputs host;
            };
            modules = [
              home-manager.darwinModules.home-manager
              ./common
              ./programs
            ];
          }
        )
      );

      apps = lib.genAttrs platforms (platform: scripts);

      # To support 'nix fmt …'.
      formatter = lib.genAttrs platforms (platform: nixpkgs.legacyPackages.${platform}.nixfmt-rfc-style);
    };
}
