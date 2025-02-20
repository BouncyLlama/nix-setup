{ inputs, config, pkgs, ... }:

{
    services.xserver = {
    enable=true;
    desktopManager={
      xterm.enable=false;
      xfce={enable=true;
      noDesktop=true;
      enableXfwm=false;
      };
    };
    windowManager.i3={
      enable=true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
        rofi
      ];
      # configFile=../dots/i3/config;
    };
  };
  services.displayManager={
    defaultSession="xfce+i3";
  };
}