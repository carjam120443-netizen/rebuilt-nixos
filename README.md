# Rebuilt-NixOS

Rebuilt-NixOS is a rebranded NixOS distribution project.

The goal is to keep the NixOS architecture and nixpkgs ecosystem while adding Rebuilt branding and configuration.

## Build

This repository uses a Nix flake and can build an ISO with:

```bash
nix build .#iso
```

The GitHub Actions workflow builds the ISO automatically on pushes to `main` and can also be started manually.

## Upstream

Rebuilt-NixOS is built from upstream NixOS/nixpkgs rather than copying the entire upstream repository into this repository. The flake pins the upstream NixOS source and the local configuration provides the Rebuilt-NixOS identity.

This keeps the project maintainable and makes upstream updates much easier to pull in.
