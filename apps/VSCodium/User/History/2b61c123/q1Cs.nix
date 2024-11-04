{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
		l = "eza -lh --group-directories-first";
		la = "eza -lha --group-directories-first";
	};
    
	shellAbbrs = {
	
	### NIXOS

	# NIXOS GENERAL
	# list active channel
	lsch = "sudo nix-channel --list";
	# delete old stuff
	clean = "sudo nix-collect-garbage --delete-older-than 3d";
	# look when something is being delete
	lst = "systemctl list-timers";
	# list generations
	lsgen = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";

	# WITHOUT FLAKES
	#up = "sudo nix-channel --update";
	#rs = "sudo nixos-rebuild switch";

	# WITH FLAKES
	# update nix flake, has to be in the directory of the flake.lock file
	#up = "cd ~/nixcfg; nix flake update;";
	# update the system
	#rs = "sudo nixos-rebuild switch --flake ~/nixcfg";
	
	# WITH FALKES AND HOME MANAGER
	up = "cd ~/nixcfg; nix flake update;";
	# UPDATE SYSTEM
	rs = "sudo nixos-rebuild switch --flake ~/nixcfg";
	rsh = "home-manager switch --flake ~/nixcfg";
	
	# CLI COMMANDS
	t = "btop";
	ri = "rg -i";
	s = "sudo";
	d = "du -sh *";
	sfi = "source ~/.config/fish/config.fish";
	
	# SHORCUTS FOR PROGRAMS
	e = "micro";
	
	# POWER
	sd = "shutdown now";
	re = "reboot";
	
	# YOUTUBE DOWNLOAD
	#yab = "cd ~/Downloads/; yt-dlp -x --audio-format mp3 -f bestaudio = "
	#ya = "cd ~/Downloads/; yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 = "
	#yv = "cd ~/Downloads/; yt-dlp = "
	
	# PYTHON3 SERVER
	#py = "python3 -m http.server -b = "
	
	# git
	#gc = "cd /BIGDATA/git; git clone";
    };
  };

}
