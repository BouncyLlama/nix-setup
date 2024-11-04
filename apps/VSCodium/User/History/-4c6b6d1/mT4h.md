# HOME-MANAGER SETUP

**INSTALLING STANDALONE**
- manged by user accounts
- system and user configurations are separated

https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone

```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
```
```
nix-channel --update
```

```
nix-shell '<home-manager>' -A install
```

**if you get error like home manager source not found, or whatever, just logout and run install again**

If it's installed properly it will say staring home manaer activation...

It will crate a file `home.nix`


**REBUILD SYSTEM WHIT HOME MANAGER (rebuild switch in nixos)**

```
home-manager switch
```

copy `home.nix` to you dofiles directory

```
cp ~./config/home-manager/home.nix ~/nix
```

**ADD HOME-MANAGER TO YOUR FLAKE FILE**

>At `flake.nix` config file add:

```
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        niki = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
      };

      homeConfigurations = {
        y = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
      };

  };


```

```
micro ~/nix/home.nix
```

**AFTER EDITING RUN in config dir:** (all config files shoud have user permission)

```
home-manager switch --flake .
```

---

**RESTORE HOME-MANAGER CONFIGURATION**

To list home manager generations:

```
home-manager generations
```

You will get a list like this:

```

```

To activate a specific generation add `/activate` at the end of generation link:

```

```

Than just switch (in `~/nix` folder):

```
home-manager switch --flake .
```