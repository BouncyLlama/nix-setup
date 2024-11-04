sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

cd ~/nix

sudo nixos-rebuild switch --flake .#niki
