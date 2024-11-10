let
    pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
  packages = with pkgs; [
  #gnome-frog
  #lf
  #yazi
  #warpinator
  #webhttrack website copier
  #yakuake
  #curl
  #wget
  #audacious
  #xournal++
  #alacritty
  #shotwell
  #filelight # show disk usage and delete unused files
  #czkawka # finding duplicate photos
  #bulk_extractor # A digital forensics tool for extracting information from file systems
  double commander
  ];
}
