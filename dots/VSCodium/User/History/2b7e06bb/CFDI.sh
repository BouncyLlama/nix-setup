git clone https://github.com/fryalien/nix/

nixos-generate-config --show-hardware-config > ~/nix/hardware.nix

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

NIX_CONFIG="experimental-features = nix-command flakes" 

sudo nixos-rebuild switch --flake .#niki
