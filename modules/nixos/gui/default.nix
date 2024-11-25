{
  imports = [
    # ./gnome.nix
    ./budgie.nix
  ];
  services.xserver.enable = true;
}
