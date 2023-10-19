{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    #devenv.url = "github:cachix/devenv";
    devenv.url = "github:cachix/devenv/python-rewrite";
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
    devenv-up = self.devShells.x86_64-linux.default.config.procfileScript;
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
                simple-http-server
              ];
              languages.ocaml = {enable = true;};
              enterShell = ''
                rm -rf ./build
                soupault
                nohup simple-http-server --index --nocache -o -p 8999 ./build 2>&1 &
              '';
              # process.implementation = "process-compose";
              # process-manager.process-compose.config = {
              #   serve.cmd = "simple-http-server --index --nocache -p 8999 ./build";
              #   open-browser.cmd = "$BROWSER 0.0.0.0:8999";
              #   oepn-browser.depends_on.serve.condition = "process_completed_successfully";
              #   rebuild.exec = "ag -l | entr -n -s 'soupault'";
              #   newterm.exec = "wezterm start --cwd .";
              # };
              # process.implementation = "process-compose";
              processes = {
                serve.exec = "nohup simple-http-server --index --nocache -p 8999 ./build &";
                open-browser.exec = "$BROWSER 0.0.0.0:8999";
                # open-browser.process-compose.depends_on.serve.condition = "process_completed_successfully";
                #rebuild.exec = "ag -l | entr -n -s 'soupault'";
                newterm.exec = "wezterm start --cwd .";
              };
            }
          ];
        };
      });
  };
}
