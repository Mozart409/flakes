{ pkgs, ... }:
{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  # https://nixos.asia/en/git
  programs = {
    git = {
      enable = true;
      userName = "Amadeus Mader";
      userEmail = "amadeus@mozart409.com";
      ignores = [ "*~" "*.swp" ];
      aliases = {
        ci = "commit";
	      s = "status";
	      f = "fetch";
      };
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = "true";
        credential.helper = "oauth";
      };
    };
    lazygit.enable = true;
  };

}
