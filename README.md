# dotfiles

My collection of dotfiles, managed by [chezmoi](https://www.chezmoi.io/).

Currently configured for Arch+Hyprland.

## Installation

On a fresh machine:
```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jamespullar
```
This will install chezmoi and my collection of dotfiles.

Confirm changes that will be applied to your home directory:
```
chezmoi diff
```

Once confirmed, then run:
```
chezmoi apply
```
