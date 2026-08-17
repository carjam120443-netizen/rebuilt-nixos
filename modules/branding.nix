{ config, pkgs, lib, ... }:

{
  networking.hostName = "rebuilt-nixos";
  system.nixos.label = "Rebuilt-NixOS-${config.system.nixos.version}";

  environment.etc."os-release".text = lib.mkForce ''
    NAME="Rebuilt-NixOS"
    PRETTY_NAME="Rebuilt-NixOS ${config.system.nixos.version}"
    ID=rebuilt-nixos
    ID_LIKE=nixos
    VERSION="${config.system.nixos.version}"
    HOME_URL="https://github.com/carjam120443-netizen/rebuilt-nixos"
    SUPPORT_URL="https://github.com/carjam120443-netizen/rebuilt-nixos/issues"
    BUG_REPORT_URL="https://github.com/carjam120443-netizen/rebuilt-nixos/issues"
  '';

  environment.etc."issue".text = ''
    Welcome to Rebuilt-NixOS ${config.system.nixos.version}\n
    A community rebuild of NixOS with the Rebuilt-NixOS identity.\n
  '';

  services.getty.greeting = lib.mkForce ''
    \n    ╔══════════════════════════════════════════════╗
    ║              REBUILT-NIXOS                  ║
    ║     Rebuilt from the NixOS ecosystem        ║
    ╚══════════════════════════════════════════════╝
    \n  '';
}
