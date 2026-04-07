# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal developer environment configuration repository. It contains dotfiles, setup guides, and configuration files for setting up a development environment on macOS and Linux (WSL2/Ubuntu). There is no build system, test suite, or runnable application — the primary artifacts are configuration files to be copied/symlinked into place and Markdown setup guides.

## Repository Structure

- `iterm2_setup/` — macOS terminal setup: iTerm2 profiles, fonts (Powerline/Nerd fonts), and `zshrc` (oh-my-zsh with agnoster theme)
- `vim_setup/` — Vim configuration: `vimrc` with vim-plug plugin management, `vim_setup.md` setup guide
- `lvim_setup/` — LunarVim (Neovim) configuration: `config.lua` with LSP/treesitter/plugin settings, `lvim_setup.md` setup guide
- `homebrew_setup/` — Homebrew installation and package notes
- `installed_software/` — Links to download common tools (Docker, Postman, Postgres, GitHub)
- `mac_dev_setup/` — macOS-specific developer environment setup notes
- `wsl_dev_setup/` — WSL2/Linux developer environment setup notes

## Key Configuration Files

### zshrc (`iterm2_setup/zshrc`)
- oh-my-zsh with `agnoster` theme and `git`, `zsh-autosuggestions` plugins
- `zsh-syntax-highlighting` via Homebrew
- Editor: `lvim` (LunarVim)
- Key aliases: `v=lvim`, `ll`, `ltr`, `gb`, `gs`, `python=python3`, `pip=pip3`
- Includes nvm and Rust/cargo setup

### vimrc (`vim_setup/vimrc`)
- Plugin manager: vim-plug (`call plug#begin()`)
- Theme: gruvbox (dark)
- Key plugins: NERDTree, vim-airline, vim-gitgutter, vim-floaterm, nerdcommenter
- Leader key: `\` (default)
- Indentation: 4 spaces for most languages, 2 spaces for HTML/JSON/XML/Vim

### LunarVim config (`lvim_setup/config.lua`)
- Theme: gruvbox (dark)
- Leader key: `Space`
- NvimTree on right side; format-on-save disabled
- Treesitter parsers: bash, c, javascript, json, lua, python, java, go, yaml, markdown
- Key normal-mode bindings: `<C-s>` save, `<C-t>` terminal, `<S-n>`/`<S-p>` buffer cycle, `vs`/`hs` splits
- After changing plugin config: `:PackerInstall` then `:PackerCompile`

## Deploying Configs

To use these configs on a new machine, copy or symlink the relevant files:

```sh
cp iterm2_setup/zshrc ~/.zshrc
cp vim_setup/vimrc ~/.vimrc
cp lvim_setup/config.lua ~/.config/lvim/config.lua
```

LunarVim install command (release-1.2 for neovim 0.8):
```sh
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

LunarVim requires: `ripgrep`, `lazygit`, `fd-find` (install via Homebrew or apt).
