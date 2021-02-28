# Cloned from [Никиточка](https://git.mcmodder.ru/mcmodder/dotfiles-patches)

# ~~Prototik's~~ McModder's dotfiles
Collection of standalone configs for zsh for easy-to-use setup for new machines /etc

## One-click installation
Main method of installation involves moving (almost) all zsh related things to separate directory and cloning this repo to that directory:

```zsh
zsh <(curl -Ls https://git.modder.pw/mcmodder/dotfiles-patches/raw/master/install.zsh)
```
You can specify ZDOTDIR location by `-z` argument (by default ~/.zsh).

## Manual installation
```
echo 'ZDOTDIR="$HOME/.zsh"` >> ~/.zshenv
source ~/.zshenv
git clone https://git.modder.pw/mcmodder/dotfiles-patches.git "$ZDOTDIR"
```

## Configure keybinds
Generate zkbd mapping for you terminal:
```zsh
autoload zkbd && zkbd
# Follow the instruction for zkbd
```

You rocks! Just restart your terminal (or do `source "$ZDOTDIR/.zshrc"`) to see changes

## Updating
This template contains simple wrapper around `git` called `rc`. To update your dotfiles do `rc update`.

## Customizing
Add new files to `$ZDOTDIR/.zshrc.d` with zsh extension and... that's it. You need more? Why?
