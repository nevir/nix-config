{ inputs, host, ... }:
{
  imports = [ inputs.homebrew.darwinModules.nix-homebrew ];

  system.primaryUser = host.user;

  # https://github.com/zhaofengli/nix-homebrew
  nix-homebrew = {
    user = host.user;
    enable = true;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    caskArgs = {
      # Disable "…application downloaded from the internet…" prompts.
      no_quarantine = true;
    };
  };
}
