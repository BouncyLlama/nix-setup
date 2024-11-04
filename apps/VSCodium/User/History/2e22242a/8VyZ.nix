{ config, pkgs, ... }:

{

  #imports =
  #  [
      #./app/browser/librewolf.nix
      #./app/browser/chromium.nix
      #./app/browser/brave.nix
  #  ];

  # Home Manager data.
  home.username = "y";
  home.homeDirectory = "/home/y";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Home Manager dotfiles.
  home.file = {
   ".config/fish".source = ./system/fish;
   ".local/share/konsole".source = ./apps/konsole;
   ".config/alacritty".source = ./apps/alacritty;
   ".config/kitty".source = ./apps/kitty;
   #".config/GitHub Desktop".source = ./apps/GitHub Desktop;
   ".config/hypr".source = ./hyprland/hypr;
  };

  # Home Manager can also manage your environment variables.
  home.sessionVariables = {
    EDITOR = "micro";
  };

  # home.file."~/.config/fish/config.fish".source = ./system/config.fish;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
