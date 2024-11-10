
@librephoenix
11 months ago
Thanks!
My recording/editing setup is OBS + Kdenlive,
and my rice is mainly Hyprland + Stylix.
The fonts are Intel One Mono.
I'll definietly get around to making videos on my recording setup and my whole config someday though :)
Here are links to my config if you're curious: https://gitlab.com/librephoenix/nixos-config or https://github.com/librephoenix/nixos-config

---

It's actually just zsh :) All I did is set the PROMPT and RPROMPT environment variables.  Here's what mine are:

PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f%F{green}→%f "
RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"

Also, here's how I configure that (and the rest of my shell) in my Nix config if you're curious: https://gitlab.com/librephoenix/nixos-config/-/blob/main/user/shell/sh.nix?ref_type=heads or https://github.com/librephoenix/nixos-config/blob/main/user/shell/sh.nix

I don't think those environment variables work for anything other than zsh though

---

Q: I am new to nixos I have got the config set up but I am unable to share my screen on google meet I am using hyprland can you or anyone help out?

A:
Hmm...

I would say first, make sure you have the xdg-desktop-portal-hyprland package.  

Then, you need to make sure your browser is running as a wayland app (not an xwayland app).  You can check this by opening your web browser and running the command: hyprctl clients  Check the settings for the browser and if it says "xwayland: 1" then you need to fix that.

I remember in order to get Brave working I needed to change the settings to enable the ozone platform and change the ozone platform to wayland or auto.  You should be able to test on the terminal with {browserName} --enable-features=UseOzonePlatform -ozone-platform=wayland.  I think there are also dedicated wayland versions of firefox-based browsers that you could try if your using something like firefox or librewolf.

Hope this helps!

---

