{ config, pkgs, ... }:

{

# imports =
#   [
#     ./dots/browser/librewolf.nix
#     #./dots/browser/chromium.nix
#     #./dots/browser/brave.nix
#   ];

  # Home Manager data.
  home.username = "ethan";
  home.homeDirectory = "/home/ethan";

  # Installation ISO.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Home Manager dotfiles.
  home.file = {
    ".local/share/konsole".source = ./dots/konsole;
    ".config/alacritty".source = ./dots/alacritty;
    ".config/kitty".source = ./dots/kitty;
    ".config/i3"={source = ./dots/i3;
    onChange =''${pkgs.i3}/bin/i3-msg reload'';
    };
    #".config/foot".source = ./dots/foot;
    #".config/waybar".source = ./dots/waybar;
    #".config/rofi".source = ./dots/rofi;
  };

  # Home Manager can also manage your environment variables.
  home.sessionVariables = {
    EDITOR = "nano";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
