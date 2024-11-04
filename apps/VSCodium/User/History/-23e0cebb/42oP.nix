{ config, pkgs, ... }:

{

# List packages installed in system profile. To search, run:
# $ nix search wget
environment.systemPackages = with pkgs; [
    neovim
    brave
    nextcloud-client
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
    krename
    kdePackages.dolphin-plugins
    kdePackages.ark
    kdePackages.kbackup
    kdePackages.kio-admin
    kdePackages.kate
    syncthing
    syncthingtray
    rustdesk-flutter
    freefilesync
    vscodium
    ];

}