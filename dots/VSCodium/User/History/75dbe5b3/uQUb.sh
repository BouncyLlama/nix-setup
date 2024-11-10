sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

mkdir ~/nix

cd ~/nix

nixos-generate-config --show-hardware-config > ~/nixcfg/hardware.nix

sudo nixos-rebuild switch --flake .#niki
