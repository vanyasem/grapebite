# grapebite

Scripts for managing Windows games under Arch GNU/Linux

## Usage

1. Upon installation, run `grapebite` to configure basic settings
2. Install desired games using the built-in menu
3. Launch games from the command line

**List of supported titles:**

- Steam - `steam`
- GTA V - `gtav`
- Origin - `origin`
- Battle.net - `battlenet`
- World of Tanks RU - `wot`
- SAMP - `samp`

## Installation

`grapebite` is [available in the AUR](https://aur.archlinux.org/packages/grapebite-git):

```
trizen -S grapebite-git
```

## Spellcheck

This collection of scripts is checked with:

`shellcheck -x --color=always -e SC2039 -e SC2162 -e SC1090 *.sh | less -R`

Exclusions:

- SC2039 - `source` instead of `.`
- SC2162 - no `-r` in `read`
- SC1090 - unable to follow non-constant path

## License

Copyright (C) 2018 Ivan Semkin

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
