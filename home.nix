{ config, pkgs, ... }:

{

  #imports =
  #  [
      #./dots/browser/librewolf.nix
      #./dots/browser/chromium.nix
      #./dots/browser/brave.nix
  #  ];

  # Home Manager data.
  home.username = "y";
  home.homeDirectory = "/home/y";

  # Installation ISO.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Home Manager dotfiles.
  home.file = {
    ".config/fish".source = ./dots/fish;
    ".local/share/konsole".source = ./dots/konsole;
    ".config/alacritty".source = ./dots/alacritty;
    ".config/kitty".source = ./dots/kitty;
    #".config/hypr".source = ./hyprland/hypr;
  };

  # Home Manager can also manage your environment variables.
  home.sessionVariables = {
    EDITOR = "micro";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
