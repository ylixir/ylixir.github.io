---
published: false
---
## default.nix
```nix
let
pkgs = import <nixpkgs> {};
in
  with pkgs; [
    nodejs
  ]
```

## reason go
```sh
nix run
npm init
npm install --save-dev bs-platform
./node_modules/.bin/bsb -init .
```

## add build targets
```json
{
  "scripts": {
    "clean": "bsb -clean-world",
    "build": "bsb -make-world",
    "watch": "bsb -make-world -w"
  }
}
```

## build and run
```sh
npm run build
node src/demo.bs.js
```