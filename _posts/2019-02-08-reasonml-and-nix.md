---
published: true
---
The official reason docs go with installing bucklescript globally. This results in a development environment that is hard to reproduce.

Instead we are going to use nix to create a simple development environment, and keep our dependencies local and reproducable.

## Set up nix
First we need to configure nix. If you don't have nix installed, you can [get it here.](https://nixos.org/nix/).

You will need to create a `default.nix` file in your project root directory. Put the following configuration in the file.

```nix
let
pkgs = import <nixpkgs> {};
in
  with pkgs; [
    nodejs
  ]
```

## Reason go
Now with four commands we can create a reasonml project.
```sh
#enter the development environment
nix run

#initialize our package.json
npm init

#install reason locally
npm install --save-dev bs-platform

#initialize reason boilerplate/create hello world
./node_modules/.bin/bsb -init .
```

## Build it
Okay, now we have a start to our project with a `src/demo.ml` file. But it won't build out of the box. Let's add some convenience scripts to our `package.json`.

```json
{
  "scripts": {
    "clean": "bsb -clean-world",
    "build": "bsb -make-world",
    "watch": "bsb -make-world -w"
  }
}
```

And now we can build and run it!
```sh
npm run build
node src/demo.bs.js
```

## Have fun with your new Reason development environment.