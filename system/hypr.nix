{ inputs, config, pkgs, ... }:

{
  # Enable Cachix (https://wiki.hyprland.org/Nix/Cachix/)
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

#  # Enable hyprland (https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/)
#  programs.hyprland = {
#    enable = true;
#    # set the flake package
#    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
#    # make sure to also set the portal package, so that they are in sync
#    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
#    xwayland.enable = true;
#  };

  # Enable hyprland simple (https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # INSTALL PACKAGES
  environment.systemPackages = with pkgs; [

    xfce.ristretto
    kitty
    foot

    # KDE DOLPHIN
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark
    kdePackages.konsole
    kdePackages.kio-admin
    kdePackages.breeze-icons
    kdePackages.kwrite

    # ICONS
    dracula-icon-theme
    nordzy-icon-theme
    epapirus-icon-theme
    morewaita-icon-theme
    la-capitaine-icon-theme
    gnome-icon-theme

    # status bar
    waybar
    # notifications
    swaynotificationcenter
    libnotify
    # wallpaper
    hyprpaper
    # app launcher
    rofi-wayland
    wofi
    # screenshots
    grim
    slurp
    hyprshot
    # clipboard
    cliphist
    wl-clipboard
    # file manager
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    # logout menu
    wlogout
    # GTK theme
    magnetic-catppuccin-gtk
    tokyonight-gtk-theme
    # KDE theme
    catppuccin-kvantum
    # Setup GTK themes (.icons .themes)
    nwg-look
    # QT themes stuff
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qt6ct
    themechanger
    #kdePackages.qtstyleplugin-kvantum
    qt5.qtwayland
    qt6.qtwayland
    # XDG portal
    xdg-desktop-portal-hyprland
    # UTILS
    pavucontrol
    polkit_gnome
    hyprpicker
    wtype
    font-manager
  ];

}
