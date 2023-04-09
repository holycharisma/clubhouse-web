{
  description = "hcc build flake";

  inputs = {

    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";     
    
  };


  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            pkg-config
            openssl
            openssl.bin

            glibc
            nodejs
            wasm-pack
            binaryen

            (rust-bin.stable.latest.default.override {
              extensions = [ "rust-src" ];
              targets = [
                "x86_64-unknown-linux-gnu"  
                "wasm32-unknown-unknown"
              ];
            })

          ];

        };
      }
    );

}