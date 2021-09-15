# Hoshiya's Horrible Dotfiles

## Available Configs

at configs/ (the weird file tree is for stow support)
- Alacritty
- BSPWM (Current WM)
- Fortune (quotes)
- i3
- Jupyter Notebook
- MPD
- NeoFetch (default config)
- Neovim
- Picom (default config)
- Polybar
- SXHKD (Using with BSPWM)
- Starship Shell (I dont use it anymore)
- TMUX
- zsh (mostly stolen from [Luke Smith's repo](https://github.com/LukeSmithxyz/voidrice))

My aliases, shell profile, my profile and my scripts are also loaded in...
also, **I use Arch btw!**


## Installation

```
# Install Plugins and Plugin Managers like Vim-Plug and TPM
./installplugs

# Install dotfiles with GNU Stow
./installdots
```

## Note:

You'll need to install GNU Stow to install the dotfiles.
Do `sudo pacman -S stow` (stow will be installed with `installplugs` scripts anyway).
The installation scripts aren't polished. So, if you find any bugs please open an issue. Also, feel free to contribute I'll be happy to review anderge your PR!

