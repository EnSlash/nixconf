{ username, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit username; };

    users.${username}.imports = [ ../home ];
  };
}
