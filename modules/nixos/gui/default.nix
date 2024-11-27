{
  imports = [
    # ./gnome.nix
    # ./budgie.nix
    ./plasma.nix
  ];
  services.xserver.enable = true;
}
