{ config, pkgs, ... }:

{

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
      krename
      kdePackages.kbackup
      kdePackages.ark
      kdePackages.dolphin-plugins
      kdePackages.kio-admin
      kdePackages.kate
    ];

  # Enable VirtualBox guest
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.seamless = true;
  virtualisation.virtualbox.guest.clipboard = true;

}
