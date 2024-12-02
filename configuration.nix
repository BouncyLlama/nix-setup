{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ./system/kde.nix
      #./system/hypr.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable the SDDM display manager.
  services.displayManager.sddm.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11.
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Hostname.
  networking.hostName = "niki";

  # Enable networking.
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true; # Wi-fi via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

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
  users.users.y = {
    isNormalUser = true;
    description = "y";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      micro
      neovim
      xterm
      vscodium
      geany
      chromium
      git
      vlc
      p7zip
      archiver
      fzf
      bat
      eza
      btop
      fastfetch
      meld
      ripgrep
      tmux
      tldr
      ffmpeg
      gparted
      localsend
      catppuccin-cursors.mochaMauve
    ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    kitty
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
    freetube
    vivaldi
    tenacity
    wireshark
    obsidian
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
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];

  # Installation ISO.
  system.stateVersion = "24.05";

  # Automatic Garbage Collection.
  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      };

  # Enable fish.
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Syncthing.
  services.syncthing = {
  enable = true;
  openDefaultPorts = true;
    group = "users";
    user = "y";
    dataDir = "/home/y/BIGDATA/SYNCTHING";    # Default folder for new synced folders
    configDir = "/home/y/BIGDATA/SYNCTHING/.config/syncthing";   # Folder for Syncthing's settings and keys
  };

  # Enable VirtualBox.
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "y" ];

  # Extensions for VirtualBox
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Enable Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.extraGroups.libvirtd.members = [ "y" ];

  # Enable flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
