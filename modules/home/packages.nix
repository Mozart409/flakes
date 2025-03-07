{ pkgs, ... }:
{
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    # Unix tools
    ripgrep # Better `grep`
    fd
    sd
    tree
    gnumake

    freshfetch
    nnn
    gh
    glow
    git
    git-credential-oauth

    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt

    # Dev
    tmate

    # On ubuntu, we need this less for `man home-configuration.nix`'s pager to
    # work.
    less

    # steam
    steam
    steam-run

    openrgb-with-all-plugins
    gparted
    alacritty

    nixfmt-rfc-style
    nil
    git-credential-oauth

    tor-browser

  ];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    # Better `cat`
    bat.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;

    tmux.enable = true;

    alacritty.enable = true;


    #    steam.enable = true;

    fish = {
      enable = true;
      interactiveShellInit = ''set fish_greeting # Disable greeting'';
    };
  };
}
