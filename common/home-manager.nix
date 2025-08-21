{ host, ... }:
{
  users.users.${host.user} = {
    name = "${host.user}";
    home = "/Users/${host.user}";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${host.user} =
      { ... }:
      {
        home.packages = [ ];
        home.stateVersion = "25.05";
      };
  };

}
