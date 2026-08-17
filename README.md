# Rebuilt-NixOS

Rebuilt-NixOS is a rebranded NixOS distribution project focused on a recognizable Rebuilt desktop, graphical installer, custom artwork, and reproducible builds.

## What is included

- Rebuilt-NixOS system branding and `/etc/os-release` identity
- Rebuilt-NixOS `0.1.0` release version
- GNOME desktop environment
- Calamares graphical installer on the live ISO
- Rebuilt-NixOS ISO volume and filename branding
- Original dark futuristic Rebuilt-NixOS SVG wallpaper
- Shared Rebuilt-NixOS ASCII logo for terminal fetch tools
- `fastfetch` plus compatibility commands named `neofetch`, `screenfetch`, and `pfetch`
- Git, curl, wget, Firefox, GParted, and Vim on the live image
- GitHub Actions ISO builds
- Tagged GitHub releases with the generated ISO attached

## Build locally

```bash
nix build .#iso
```

The ISO is produced under `result/iso/`.

## Release

The version is stored in `VERSION`. Create a Git tag matching `vMAJOR.MINOR.PATCH` to trigger the release workflow. For example:

```bash
git tag v0.1.0
git push origin v0.1.0
```

GitHub Actions will build the ISO and attach it to the GitHub release.

## Fetch tools

The default Rebuilt-NixOS fetch configuration uses the custom ASCII artwork in `assets/rebuilt-ascii.txt`. `rebuilt-fetch` is the native command; `neofetch`, `screenfetch`, and `pfetch` compatibility commands use the same Rebuilt-NixOS artwork through fastfetch.

## Wallpaper

The repository includes an original SVG wallpaper designed for Rebuilt-NixOS. It uses a dark blue futuristic Linux aesthetic and is stored at `assets/rebuilt-wallpaper.svg`, so the project does not need to redistribute a third-party raster wallpaper.

A KDE Store Linux wallpaper was used as visual inspiration while selecting the direction for the theme.

## Upstream

Rebuilt-NixOS keeps the upstream NixOS architecture and nixpkgs ecosystem instead of copying the enormous upstream source tree into this repository. The flake currently tracks the NixOS `25.11` branch, while the Rebuilt-NixOS modules provide the distro-specific layer.

A future stage can move nixpkgs into a separately maintained Rebuilt-NixOS fork once there is a reason to maintain package-level changes independently from upstream.
