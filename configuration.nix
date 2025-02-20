{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
     # ./system/kde.nix
      #./system/hypr.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable the SDDM display manager.
  services.displayManager.defaultSession="xfce"

  # Enable the X11 windowing system.
  services.xserver = {
    enable=true;
    desktopManager={
      xterm.enable=false;
      xfce.enable=true;
    };
  };
  

  # Configure keymap in X11.
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Hostname.
  networking.hostName = "harbinger";

  # Enable networking.
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true; # Wi-fi via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.ethan = {
    isNormalUser = true;
    description = "ethan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      neovim
      xterm
      vscodium
      git
      p7zip
      fzf
      bat
      eza
      btop
      tmux
      ffmpeg
      gparted
      catppuccin-cursors.mochaMauve
    ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    kitty
    librewolf
    mpv
    qbittorrent
    imagemagick
    vivaldi
    tenacity
    wireshark
    tokyonight-gtk-theme
    parabolic
  ];

  # Fonts.
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" "Ubuntu"]; })
    ubuntu_font_family
    font-awesome
  ];

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Enable the firewall.
  networking.firewall.enable = true;

  # Open ports in the firewall (localsend).
  networking.firewall.allowedTCPPorts = [ 53317,22 ];
  networking.firewall.allowedUDPPorts = [ 53317,22 ];
  services.openssh.enable=true;
  # Installation ISO.
  system.stateVersion = "24.11";

  # Automatic Garbage Collection.
  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      };


  # Extensions for VirtualBox
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Enable Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.extraGroups.libvirtd.members = [ "y" ];

  # Enable flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
