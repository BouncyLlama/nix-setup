let
    pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
  packages = with pkgs; [
  gnome-frog
  lf
  yazi
  #warpinator
  #webhttrack website copier
  #yakuake
  #curl
  #wget
  ];
}
