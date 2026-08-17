{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix")
    ./modules/branding.nix
    ./modules/desktop.nix
    ./modules/fetch.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    gparted
    firefox
  ];

  environment.etc."wallpaper/rebuilt-nixos.svg".source = ./assets/rebuilt-wallpaper.svg;
  environment.etc."fastfetch/rebuilt-ascii.txt".source = ./assets/rebuilt-ascii.txt;

  isoImage.volumeID = "REBUILT_NIXOS";
  isoImage.edition = "rebuilt-gnome";
  isoImage.isoName = "Rebuilt-NixOS-${config.system.nixos.version}-${pkgs.stdenv.hostPlatform.system}.iso";

  services.xserver.desktopManager.gnome.favoriteAppsOverride = ''
    [org.gnome.shell]
    favorite-apps=[ 'firefox.desktop', 'org.gnome.Console.desktop', 'org.gnome.Nautilus.desktop', 'gparted.desktop', 'io.calamares.calamares.desktop' ]
  '';

  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.shell]
    welcome-dialog-last-shown-version='9999999999'
  '';

  system.stateVersion = "25.11";
}
