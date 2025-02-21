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
   
    ".config/i3"={source = ./dots/i3;
    onChange =''${pkgs.i3}/bin/i3-msg reload'';
    };
    # ".config/hypr/hyprland.conf".source=./dots/hyprland/hyprland.conf;
    # ".config/hypr/hyprpaper.conf".source=./dots/hyprland/hyprpaper.conf;
    ".config/hypr/"={
      #necessary to make the whole directory work - was getting weird read-only fs errors without this
    source=config.lib.file.mkOutOfStoreSymlink "/home/ethan/nix-setup/dots/hyprland/";
    recursive=true;
    };
   ".config/waybar/"={
      #necessary to make the whole directory work - was getting weird read-only fs errors without this
    source=config.lib.file.mkOutOfStoreSymlink "/home/ethan/nix-setup/dots/waybar/";
    recursive=true;
    };
      ".config/kak/"={
      #necessary to make the whole directory work - was getting weird read-only fs errors without this
    source=config.lib.file.mkOutOfStoreSymlink "/home/ethan/nix-setup/dots/kakoune/";
    recursive=true;
    };
      ".config/wofi/"={
      #necessary to make the whole directory work - was getting weird read-only fs errors without this
    source=config.lib.file.mkOutOfStoreSymlink "/home/ethan/nix-setup/dots/wofi/";
    recursive=true;
    };
    #       ".config/fish/"={
    #   #necessary to make the whole directory work - was getting weird read-only fs errors without this
    # source=config.lib.file.mkOutOfStoreSymlink "/home/ethan/nix-setup/dots/fish/";
    # recursive=true;
    # };
            ".config/foot/"={
      #necessary to make the whole directory work - was getting weird read-only fs errors without this
    source=config.lib.file.mkOutOfStoreSymlink "/home/ethan/nix-setup/dots/foot/";
    recursive=true;
    };
    #".config/foot".source = ./dots/foot;
    #".config/waybar".source = ./dots/waybar;
    #".config/rofi".source = ./dots/rofi;
  };
  programs.starship.enable = true;
  programs.kitty.enable = true; # required for the default Hyprland config
 programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      starship init fish | source
    '';
   plugins = with pkgs.fishPlugins; [
     
      ];
  };
  programs.foot.enable=true;
  programs.bash = {
  enable=true;
  initExtra = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';
};
  # Home Manager can also manage your environment variables.
  home.sessionVariables = {
    EDITOR = "nano";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  

}
