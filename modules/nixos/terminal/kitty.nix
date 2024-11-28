{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    # custom settings
    font = {
      size = "13";
      name = "fira-code";
    };

    shellIntegration = {
      shellIntegration = true;
    };
    environment = {
      "TERM" = "xterm-256color";

    };
    # themeFile = "kanagawa";
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
    };
  };


  environment.systemPackages = with pkgs; [
    pkgs.kitty
    pkgs.kitty-img
    pkgs.kitty-themes
  ];
}
