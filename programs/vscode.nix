{ host, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  home-manager.users.${host.user} =
    { ... }:
    {
      programs.vscode = {
        enable = true;
      };
    };
}
