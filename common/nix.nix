{ host, ... }:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };

  system = {
    stateVersion = host.stateVersion;
  };

  nixpkgs = {
    hostPlatform = host.platform;

    config = {
      allowUnfree = true;
    };
  };
}
