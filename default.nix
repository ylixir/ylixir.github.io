let
pkgs = import <nixpkgs> {};
# yarn = pkgs.yarn.override { nodejs = pkgs.nodejs-8_x; };
in
  with pkgs; [
    yarn
    jekyll
 #   nodejs-8_x
  ]


