# .dotfiles

## Requirements
* zsh
* git
* [Awesome Patched Terminal Fonts](https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy/patched)

## Installation
```
$ git clone https://github.com/mfakane/.dotfiles.git
$ cd .dotfiles
$ make
```

## How to add local settings
Make either `~/.zshrc_local`, `~/.zshenv_local`, or both to write any machine-specific local settings.
These files would be read automatically when exists.
