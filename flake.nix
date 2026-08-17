{
  description = "Rebuilt-NixOS — a rebranded NixOS distribution";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.rebuilt-nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };

      packages.${system}.iso =
        self.nixosConfigurations.rebuilt-nixos.config.system.build.isoImage;
    };
}
