{ pkgs, lib, ... }:
{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = lib.mkDefault true;
  services.desktopManager.plasma6.enable = lib.mkDefault true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    pkgs.plasma
    pkgs.qogir-kde
    pkgs.sweet-nova
    pkgs.arc-kde-theme
  ];

  /* programs.plasma = {
    enable = true;

    #
    # Some high-level settings:
    #
    workspace = {
      clickItemTo = "select";
      # lookAndFeel = "org.kde.breezedark.desktop";
      lookAndFeel = "com.github.vinceliuice.Qogir-dark";
      cursor.theme = "Sweet-cursor";
      iconTheme = "Breeze-Dark";
      # wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
    };
  }; */

}
