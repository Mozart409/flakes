# My personal configuration

## Useful

> List all generations
```bash
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
```

> Wipe generations older than 3 days
```bash
sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 3d
