{ config, pkgs, lib, ... }:

{
  imports = [
    "${pkgs.path}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  networking.hostName = "rebuilt-nixos";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    fastfetch
  ];

  environment.etc."os-release".text = lib.mkForce ''
    NAME="Rebuilt-NixOS"
    PRETTY_NAME="Rebuilt-NixOS"
    ID=rebuilt-nixos
    ID_LIKE=nixos
    HOME_URL="https://github.com/carjam120443-netizen/rebuilt-nixos"
  '';

  system.nixos.label = "Rebuilt-NixOS";

  services.getty.greeting = lib.mkForce ''
    Welcome to Rebuilt-NixOS!
    Based on NixOS and nixpkgs.
  '';

  system.stateVersion = "25.11";
}
