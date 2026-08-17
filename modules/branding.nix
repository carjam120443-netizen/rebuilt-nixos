{ config, pkgs, lib, ... }:

let
  rebuiltVersion = lib.strings.trim (builtins.readFile ../VERSION);
in
{
  networking.hostName = "rebuilt-nixos";
  system.nixos.label = "Rebuilt-NixOS-${rebuiltVersion}";

  environment.etc."os-release".text = lib.mkForce ''
    NAME="Rebuilt-NixOS"
    PRETTY_NAME="Rebuilt-NixOS ${rebuiltVersion}"
    ID=rebuilt-nixos
    ID_LIKE=nixos
    VERSION="${rebuiltVersion}"
    VERSION_ID="${rebuiltVersion}"
    HOME_URL="https://github.com/carjam120443-netizen/rebuilt-nixos"
    SUPPORT_URL="https://github.com/carjam120443-netizen/rebuilt-nixos/issues"
    BUG_REPORT_URL="https://github.com/carjam120443-netizen/rebuilt-nixos/issues"
  '';

  environment.etc."issue".text = ''
    Welcome to Rebuilt-NixOS ${rebuiltVersion}\\n
    A community rebuild of NixOS with the Rebuilt-NixOS identity.\\n
  '';

  services.getty.greeting = lib.mkForce ''
    \\n    ╔══════════════════════════════════════════════╗
    ║              REBUILT-NIXOS                  ║
    ║                  v${rebuiltVersion}                  ║
    ║     Rebuilt from the NixOS ecosystem        ║
    ╚══════════════════════════════════════════════╝
    \\n  '';
}
