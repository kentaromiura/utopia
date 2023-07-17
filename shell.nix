{ pkgs ? import<nixpkgs> {} }:

with (import (builtins.fetchTarball "https://github.com/tweag/opam-nix/archive/main.tar.gz")).lib.${builtins.currentSystem};
let
  repos = [ (makeOpamRepo ./reason-native) opamRepository ];
  scope = queryToScope { 
	inherit repos; 
  } { 
	"opam" = "*";
    "dream" = "1.0.0~alpha5";
	"re2" = "*";
	"atdgen" = "*";
	"junit" = "*";
	"qcheck-core" = "*";
	"reason" = "*";

	"cli" = "*";
	"rely" = "*";
   };
#in scope.rely
in pkgs.mkShell {
	buildInputs = with pkgs; [
		opam
		ocaml
	] ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
		Cocoa
		CoreServices
		Foundation
		libiconv
	]);
}

# (queryToScope {} { 
	
# }).dream

