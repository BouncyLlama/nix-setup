#git clone https://github.com/fryalien/nix/

cd nix

rm -rf .git .gitatributes

nixos-generate-config --show-hardware-config > ~/nix/hardware.nix

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

sudo nixos-rebuild switch --flake ~/nix#niki

nix run home-manager/master -- switch -b backup --flake ~/nix#y
