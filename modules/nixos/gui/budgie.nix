{ pkgs, ... }:
{
  services.xserver = {
    displayManager.lightdm.enable = true;
    desktopManager.budgie.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # pkgs.gnome-tweaks
  ];
}
