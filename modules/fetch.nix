{ pkgs, ... }:

let
  rebuiltFastfetch = pkgs.writeShellScriptBin "rebuilt-fetch" ''
    exec ${pkgs.fastfetch}/bin/fastfetch --config /etc/fastfetch/rebuilt.jsonc "$@"
  '';

  neofetchCompat = pkgs.writeShellScriptBin "neofetch" ''
    exec ${pkgs.fastfetch}/bin/fastfetch --config /etc/fastfetch/rebuilt.jsonc "$@"
  '';

  screenfetchCompat = pkgs.writeShellScriptBin "screenfetch" ''
    exec ${pkgs.fastfetch}/bin/fastfetch --config /etc/fastfetch/rebuilt.jsonc "$@"
  '';

  pfetchCompat = pkgs.writeShellScriptBin "pfetch" ''
    exec ${pkgs.fastfetch}/bin/fastfetch --config /etc/fastfetch/rebuilt.jsonc "$@"
  '';
in
{
  environment.systemPackages = with pkgs; [
    fastfetch
    rebuiltFastfetch
    neofetchCompat
    screenfetchCompat
    pfetchCompat
  ];

  environment.etc."fastfetch/rebuilt.jsonc".text = builtins.toJSON {
    logo = {
      type = "file";
      source = "/etc/fastfetch/rebuilt-ascii.txt";
    };
    display = {
      separator = "  ";
    };
    modules = [
      "title"
      "separator"
      "os"
      "host"
      "kernel"
      "uptime"
      "packages"
      "shell"
      "display"
      "de"
      "wm"
      "cpu"
      "gpu"
      "memory"
      "disk"
      "localip"
    ];
  };
}
