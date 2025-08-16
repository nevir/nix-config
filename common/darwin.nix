# https://github.com/nix-darwin/nix-darwin/blob/master/modules/system/applications.nix
# …without the linking of Nix apps.
#
# ALTERNATIVE:
# https://github.com/craigfurman/nix-workstations/blob/fe7fa3da64425301a1f83f22475b6d3f20e6369d/home/apps/make-app-trampolines.sh
{ config, pkgs, ... }:
{
  disabledModules = [ "system/applications.nix" ];

  config = {
    system.build.applications = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };

    # Normally, this creates the /Applications/Nix Apps symlink…
    # …but we're opting to use Homebrew to manage GUI applications (e.g. so
    # that they're discoverable via Spotlight/Finder)
    # …so let's remove some noise.
    system.activationScripts.applications.text = "";
  };
}
