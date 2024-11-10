{ config, pkgs, ... }:

{

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # GTK THEMES
    magnetic-catppuccin-gtk

    # KDE STUFF
    krename
    kdePackages.dolphin-plugins
    kdePackages.ark
    kdePackages.kbackup
    kdePackages.kio-admin
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.kcolorchooser
    kdePackages.kolourpaint
    kdePackages.tokodon
    #kdePackages.plasma-firewall
    catppuccin-kde
  ];

}
