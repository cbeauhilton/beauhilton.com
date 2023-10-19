{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv";
    nixpkgs-python.url = "github:cachix/nixpkgs-python"; # required to set Python version
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = {
    self,
    nixpkgs,
    devenv,
    systems,
    ...
  } @ inputs: let
    forEachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    devShells =
      forEachSystem
      (system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = devenv.lib.mkShell {
          inherit inputs pkgs;
          modules = [
            {
              packages = with pkgs; [
                entr
                highlight
                pandoc
                soupault
                silver-searcher
              ];
              languages.ocaml = {enable = true;};
              languages.python = {enable = true;};
              enterShell = ''
                rm -rf ./build
                soupault --debug
              '';
              processes = {
                server.exec = "python -m http.server 8999 --directory build";
                open-browser.exec = "$BROWSER http://localhost:8999";
                rebuild.exec = "ag -l | entr -s 'soupault'";
              };
            }
          ];
        };
      });
  };
}
