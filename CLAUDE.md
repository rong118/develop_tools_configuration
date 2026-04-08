# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal developer environment configuration repository. It contains dotfiles, setup guides, and configuration files for setting up a development environment on macOS and Linux (WSL2/Ubuntu). There is no build system, test suite, or runnable application — the primary artifacts are configuration files to be copied/symlinked into place and Markdown setup guides.

## Repository Structure

- `README.md` — full setup guide covering all platforms and tools (Homebrew, iTerm2, fonts, oh-my-zsh, nvm, gvm, Miniconda, Neovim)
- `setup.sh` — interactive automated setup script for macOS, Linux, and WSL2
- `vim_bkp.zip` — archived backup of old Vim/LunarVim config files (for reference only; not deployed directly)

## Key Files

### setup.sh
- Detects OS: `macos`, `wsl`, or `linux`
- Prompts before each tool install (`y/n`) — safe to run selectively
- Backs up `~/.zshrc` to `~/.zshrc.bak` before making changes
- Installs: zsh (Linux/WSL), Homebrew (macOS), iTerm2 (macOS), Powerline fonts, oh-my-zsh, oh-my-zsh plugins, nvm, gvm, Miniconda, Neovim
- Sets oh-my-zsh theme to `agnoster` and enables plugins via `sed`
- Neovim: adds `$HOME/.local/nvim/bin` to `PATH` in `~/.zshrc`
- **Note:** nvm, gvm, and Miniconda `~/.zshrc` init lines are intentionally left for manual addition — see README for the exact snippets

### README.md
- Mirrors setup.sh steps with manual instructions and explanations
- Includes platform-specific variants (macOS Apple Silicon, macOS x86, Linux/WSL)
- Contains the `~/.zshrc` snippets required after nvm, gvm, and Miniconda installs

## Deploying on a New Machine

Run the automated script:
```sh
bash setup.sh
```

Or follow the manual steps in `README.md` section by section. After installing nvm, gvm, or Miniconda, add the corresponding `~/.zshrc` init snippets documented in README.md, then run:
```sh
source ~/.zshrc
```
