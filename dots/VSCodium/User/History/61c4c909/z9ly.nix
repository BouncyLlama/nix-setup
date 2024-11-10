{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ./system/pc-kde.nix
      #./system/pc-hypr.nix
      #./system/vm-kde.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "niki";

  # Enable fish
  programs.fish.enable = true;

  # Brightness control
  programs.light.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zagreb";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hr_HR.UTF-8";
    LC_IDENTIFICATION = "hr_HR.UTF-8";
    LC_MEASUREMENT = "hr_HR.UTF-8";
    LC_MONETARY = "hr_HR.UTF-8";
    LC_NAME = "hr_HR.UTF-8";
    LC_NUMERIC = "hr_HR.UTF-8";
    LC_PAPER = "hr_HR.UTF-8";
    LC_TELEPHONE = "hr_HR.UTF-8";
    LC_TIME = "hr_HR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the SDDM display manager.
  services.displayManager.sddm.enable = true;

  # Configure keymap in X11.
  services.xserver.xkb = {
    layout = "us";
    variant = "";
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account.
  users.users.y = {
    isNormalUser = true;
    description = "y";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      micro
      neovim
      alacritty
      vscodium
      chromium
      git
      vlc
      p7zip
      archiver
      wireshark
      obsidian
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the firewall.
  networking.firewall.enable = true;

  # Open ports in the firewall (localsend, syncthing).
  networking.firewall.allowedTCPPorts = [ 53317 8384 ];
  networking.firewall.allowedUDPPorts = [ 53317 8384 ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Automatic Garbage Collection
  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      };
      
  # Turn on flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
