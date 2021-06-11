# dotfiles

XDG-style dotfiles inspired from [ayekat/dotfiles](https://github.com/ayekat/dotfiles)

## XDG

This dotfiles tries to keep the user home directory as clean as possible by respecting the XDG base directory specification, following [The `~/.local` Convention](https://gist.github.com/Earnestly/84cf9670b7e11ae2eac6f753910efebe).

Following environment variables will be set:
| Variable          | Location             |
|-------------------|----------------------|
| `XDG_CACHE_HOME`  | `~/.local/var/cache` |
| `XDG_CONFIG_HOME` | `~/.local/etc  `     |
| `XDG_DATA_HOME`   | `~/.local/share`     |

## User-specific configuration

| Location                          | Description               |
|-----------------------------------|---------------------------|
| `~/.local/bin`                    | User-specific executables |
| `~/.local/lib/dotfiles/wrappers`  | User-specific wrappers    |

## Requirements
* PAM
* zsh or bash
* git

## Installation

1. `git clone --recursive https://github.com/mfakane/dotfiles.git ~/.local`
2. `~/.local/install.sh`
3. Re-login
