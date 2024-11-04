{ config, pkgs, ...}:

{

  programs.hyprland.enable = true;

  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  # Enable Cachix (https://wiki.hyprland.org/Nix/Cachix/)
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };

  # Desktop portals.
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  environment.systemPackages = with pkgs; [
    # status bar
    waybar
    # notifications
    dunst
    libnotify
    # wallpaper
    hyprpaper
    # terminal
    kitty
    # app launcher
    rofi-wayland
    # browser
    brave
    librewolf
    # screenshots
    grim
    slurp
    # clipboard
    wl-copy
    # file manager
    thunar
    # fonts
    font-awesome
    hack-font
    fira-code
    # logout menu
    wlogout
  ];

}

######################################################
# flake.nix
 inputs = {
  hyprland.url = "github:hyprwm/Hyprland";
  ...
 };

 ---

  #crazy bar with Elkowar's widgets, has it's own markup language
  #eww

  # Workspaces displayed correctly on Hyprland (by vimjoyer), mozda mi ne treba jer su popravili
  (pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    })
  )

  stavi cache server u hyprland file