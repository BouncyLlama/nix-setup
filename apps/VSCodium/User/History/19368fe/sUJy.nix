{ config, pkgs, ... }:

{

services.desktopManager.plasma6.enable = true;

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
