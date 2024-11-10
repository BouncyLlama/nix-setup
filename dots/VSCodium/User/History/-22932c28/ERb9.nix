{ config, pkgs, ... }:

{

# ENABLE HYPRLAND
programs.hyprland.enable = true;

# INSTALL PACKAES
environment.systemPackages = with pkgs; [
    kitty
    thunar
    syncthing
    syncthingtray
    rustdesk-flutter
    freefilesync
    vscodium
    neovim
    brave
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
  ];


}