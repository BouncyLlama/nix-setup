if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

#function fish_prompt
#    echo " ~ "
#end

set fish_color_valid_path

#function fish_prompt
#    echo (prompt_pwd) "> "
#echo (set_color -o 00d3b8)"➜" (set_color -o 3daee9)(prompt_pwd)(set_color -o yellow) "✗ "
#end

#-------------------------
# ALIASES
#-------------------------

### NIXOS GENERAL
# list active channel
abbr lsch 'sudo nix-channel --list'
# delete old stuff
abbr clean 'sudo nix-collect-garbage --delete-older-than 3d'
# look when something is being delete
abbr lst 'systemctl list-timers'
# list nixos generations
abbr lsgen 'sudo nix-env --list-generations --profile /nix/var/nix/profiles/system'
# list home-manager generations
abbr lsgenhm 'home-manager generations'

### WITHOUT FLAKES
#abbr up 'sudo nix-channel --update'
#abbr rs 'sudo nixos-rebuild switch'

### WITH FLAKES
# update nix flake, has to be in the directory of the flake.lock file
#abbr up 'cd ~/nix; nix flake update'
# update the system
#abbr rs 'sudo nixos-rebuild switch --flake ~/nix'

### WITH FALKES AND HOME MANAGER
# update flake
abbr up 'cd ~/nix; nix flake update'
# update system
abbr rs  'sudo nixos-rebuild switch --flake ~/nix'
# update home-manager
abbr rsh 'home-manager switch --flake ~/nix'
abbr rhm 'nix run home-manager/master -- switch -b backup --flake ~/nix'

# CLI COMMANDS
alias l 'eza -lh --group-directories-first'
alias la 'eza -lha --group-directories-first'
abbr t 'btop'
abbr ri 'rg -i'
abbr s 'sudo'
abbr d 'du -sh *'

# SHORCUTS FOR PROGRAMS
abbr v 'nvim'
abbr V 'sudo nvim'
abbr e 'micro'

# PLACES
abbr dw 'cd ~/Downloads'
abbr dc 'cd ~/Documents'
abbr pc 'cd ~/Pictures'
abbr vd 'cd ~/Videos'

# POWER
abbr sd 'shutdown now'
abbr re 'reboot'

# RESOLUTION
abbr 4k 'xrandr -s 3840x2160'
abbr hd 'xrandr -s 1920x1080'

# YOUTUBE DOWNLOAD
abbr yv 'cd ~/Downloads/; yt-dlp '
abbr yab 'cd ~/Downloads/; yt-dlp -x --audio-format mp3 -f bestaudio '
abbr ya 'cd ~/Downloads/; yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 '

