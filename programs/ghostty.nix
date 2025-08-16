{ host, ... }:
{
  # https://github.com/nevir/nix-config/issues/1
  homebrew.casks = [
    "ghostty"
  ];

  home-manager.users.${host.user} =
    { ... }:
    {
      programs.ghostty = {
        enable = true;
        # https://github.com/nevir/nix-config/issues/1
        package = null;

        # https://ghostty.org/docs/config/reference
        settings = {
          theme = "nord";

          # Needs Ghostty 1.2.0+
          # macos-hidden = "always";

          background-opacity = 0.85;
          background-blur = 20;

          keybind = "global:opt+space=toggle_quick_terminal";
        };
      };
    };
}
