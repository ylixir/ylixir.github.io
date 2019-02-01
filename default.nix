let
pkgs = import <nixpkgs> {};
in
  with pkgs; [
    yarn
    jekyll
    bundler
  ]


# nix run -c bundle install --path vendor/bundle
# nix run -c bundle update
# nix run -c bundle exec jekyll serve