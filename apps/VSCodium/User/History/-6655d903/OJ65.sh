git clone https://github.com/fryalien/nix/

nixos-generate-config --show-hardware-config > ~/nix/hardware.nix

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

sudo nixos-rebuild switch --flake ./nix#niki

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

sudo nix-channel --update

home-manager switch --flake ~/nix
