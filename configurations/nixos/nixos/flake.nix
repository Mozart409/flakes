{
  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-unified.url = "github:srid/nixos-unified";
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];
      imports = [ inputs.nixos-unified.flakeModules.default ];

      flake =
        let
          myUserName = "amadeus";
        in
        {
          # Configurations for Linux (NixOS) machines
          nixosConfigurations."nixos" =
            self.nixos-unified.lib.mkLinuxSystem
              { home-manager = true; }
              {
                nixpkgs.hostPlatform = "x86_64-linux";
                imports = [
                  # Your machine's configuration.nix goes here
                  ({ pkgs, ... }: {
                    # TODO: Put your /etc/nixos/hardware-configuration.nix here
                    boot.loader.grub.device = "nodev";
                    boot.loader.grub.useOSProber = true;

                    fileSystems."/" = { device = "/dev/disk/by-label/nixos"; fsType = "btrfs"; };
                    users.users.${myUserName}.isNormalUser = true;
                    system.stateVersion = "24.05";
                  })
                  # Setup home-manager in NixOS config
                  {
                    home-manager.users.${myUserName} = {
                      imports = [ self.homeModules.default ];
                      home-manager.backupFileExtension = "hm-backup";
                      home.stateVersion = "24.05";
                    };
                  }
                ];
              };

          # home-manager configuration goes here.
          homeModules.default = { pkgs, ... }: {
            imports = [ ];
            programs.git.enable = true;
            programs.starship.enable = true;
            programs.bash.enable = true;
            programs.zsh.enable = true;
            programs.fish.enable = true;
            home-manager.backupFileExtension = "hm-backup";
          };
        };
    };
}
