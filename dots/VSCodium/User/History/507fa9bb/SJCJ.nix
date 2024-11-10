{ pkgs, lib, inputs, ...}:

{
  programs.hyprland.enable = true;


}


# flake.nix
 inputs = {
  hyprland.url = "github:hyprwm/Hyprland";
  ...
 };