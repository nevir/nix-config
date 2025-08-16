{ ... }:
{
  users.users.ian = {
    name = "ian";
    home = "/Users/ian";
  };

  home-manager.users.ian =
    { ... }:
    {
      home.packages = [ ];
      home.stateVersion = "25.05";
    };
}
