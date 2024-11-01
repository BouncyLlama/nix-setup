{ config, pkgs, ... }:

{

  # ENABLE HYPRLAND
    programs.hyprland = {
      #enable = true;
      #nvidiaPatches = true;
      xwayland.enable = true;
    };

  # This is from hyprland wiki
  wayland.windowManager.hyprland.enable = true; # enable Hyprland

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

  # INSTALL PACKAGES
  environment.systemPackages = with pkgs; [
    neovim
    vscodium

    # KDE Dolphin
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark
    kdePackages.konsole
    kdePackages.kio-admin
    kdePackages.breeze-icons

    # HYPRLAND SPECIFIC
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
    # GTK theme
    magnetic-catppuccin-gtk
  ];

  # Enable VirtualBox guest
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.seamless = true;
  virtualisation.virtualbox.guest.clipboard = true;

}
