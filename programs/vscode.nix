# https://github.com/nevir/nix-config/issues/4
{ host, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode
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
