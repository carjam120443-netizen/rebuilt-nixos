{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb.layout = "us";

  programs.dconf.enable = true;

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file:///etc/wallpaper/rebuilt-nixos.svg";
      picture-uri-dark = "file:///etc/wallpaper/rebuilt-nixos.svg";
      picture-options = "zoom";
    };
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
  ];
}
