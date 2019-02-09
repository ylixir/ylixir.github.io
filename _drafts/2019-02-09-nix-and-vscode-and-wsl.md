---
published: false
---
user settings:
```json
{
  "terminal.integrated.shell.windows": "C:\\WINDOWS\\sysnative\\wsl.exe"
}
```

workspace settings:
```json
{
  "terminal.integrated.shellArgs.windows": ["~/.nix-profile/bin/nix","run","-f","nix/fast.nix","-I","nixpkgs=~/.nix-defexpr/channels/nixpkgs"]
}
```
