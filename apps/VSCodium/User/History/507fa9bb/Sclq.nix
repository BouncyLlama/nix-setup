{ pkgs, lib, inputs, ...}:

{

  programs.hyprland.enable = true;

  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };

  # Desktop portals.
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  environment.systemPackages = with pkgs; [
    waybar
    dunst
    libnotify
    hyprpaper
    kitty
    rofi-wayland
    

  #crazy bar with Elkowar's widgets, has it's own markup language
  #eww

  # Workspaces displayed correctly on Hyprland (by vimjoyer), mozda mi ne treba jer su popravili
  (pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    })
  )

];

}

######################################################
# flake.nix
 inputs = {
  hyprland.url = "github:hyprwm/Hyprland";
  ...
 };