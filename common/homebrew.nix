{ inputs, ... }:
let
  # TODO: This should be set per-host, and ideally referenced here.
  user = "ian";
in
{
  imports = [ inputs.homebrew.darwinModules.nix-homebrew ];

  system.primaryUser = user;

  # https://github.com/zhaofengli/nix-homebrew
  nix-homebrew = {
    user = user;
    enable = true;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
  };

  homebrew = {
    enable = true;
    caskArgs = {
      # Disable "…application downloaded from the internet…" prompts.
      no_quarantine = true;
    };
  };
}
