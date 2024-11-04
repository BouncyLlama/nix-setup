{ config, pkgs, ... }:

{

# ENABLE HYPRLAND
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

# INSTALL PACKAGES
environment.systemPackages = with pkgs; [
    kitty
    syncthing
    syncthingtray
    rustdesk-flutter
    freefilesync
    vscodium
    neovim
    brave
    librewolf
    nextcloud-client
    megasync
    keepassxc
    obs-studio
    github-desktop
    mpv
    qbittorrent
    spotify
    onlyoffice-desktopeditors
    yt-dlp
    imagemagick
    signal-desktop

    # KDE DOLPHIN
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark
    kdePackages.konsole
    kdePackages.kio-admin

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
  ];


}
