{ config, pkgs, ... }:

{

  # ENABLE HYPRLAND.
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  # Enable OpenGL and stuff.
  hardware.graphics.enable = true;
  hardware.nvidia.modesetting.enable = true;

  # Desktop portals.
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

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

  # INSTALL PACKAGES
  environment.systemPackages = with pkgs; [
    neovim
    alacritty
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
    syncthing
    syncthingtray
    rustdesk-flutter
    freefilesync
    vscodium

    # KDE Dolphin
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark
    kdePackages.konsole
    kdePackages.kio-admin
    kdePackages.breeze-icons

    # Icons
    dracula-icon-theme
    nordzy-icon-theme
    epapirus-icon-theme

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
    wl-clipboard
    # file manager
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    # fonts
    font-awesome
    hack-font
    fira-code
    # logout menu
    wlogout
    # GTK theme
    magnetic-catppuccin-gtk
    # QT stuff
    qt5.qtwayland
    qt6.qtwayland
  ];

  # Enable VirtualBox.
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "y" ];

  # Extensions for VirtualBox
  virtualisation.virtualbox.host.enableExtensionPack = true;

}
