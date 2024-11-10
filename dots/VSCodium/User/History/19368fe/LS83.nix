{ config, pkgs, ... }:

{

# ENABLE KDE PLASMA ENVIRONMENT
services.desktopManager.plasma6.enable = true;

# INSTALL PACKAES
environment.systemPackages = with pkgs; [
    krename
    kdePackages.kbackup
    kdePackages.ark
    kdePackages.dolphin-plugins
    kdePackages.kio-admin
  ];

  # ENABLE VIRTUAL-BOX
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.seamless = true;
  virtualisation.virtualbox.guest.clipboard = true;

}
