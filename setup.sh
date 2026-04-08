#!/usr/bin/env bash
set -eo pipefail

# ── Colors ────────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

info() { echo -e "${GREEN}==> $*${NC}"; }
warn() { echo -e "${YELLOW}[!] $*${NC}"; }
section() { echo -e "\n${CYAN}--- $* ---${NC}"; }

# ── OS Detection ──────────────────────────────────────────────────────────────
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif grep -qi microsoft /proc/version 2>/dev/null; then
        OS="wsl"
    else
        OS="linux"
    fi
    info "Detected OS: $OS"
}

# ── Helpers ───────────────────────────────────────────────────────────────────
ask() {
    local reply
    while true; do
        read -r -p "$1 [y/n] " reply
        case "$reply" in
            [Yy]) return 0 ;;
            [Nn]) return 1 ;;
            *) echo "Please answer y or n." ;;
        esac
    done
}

append_zshrc() {
    printf '%s\n' "$1" >> ~/.zshrc
}

# BSD sed (macOS) requires an explicit backup extension for -i; GNU sed does not.
sed_inplace() {
    if [[ "$OS" == "macos" ]]; then
        sed -i '' "$@"
    else
        sed -i "$@"
    fi
}

# ── Backup .zshrc ─────────────────────────────────────────────────────────────
backup_zshrc() {
    if [[ -f ~/.zshrc ]]; then
        cp ~/.zshrc ~/.zshrc.bak
        info "Backed up ~/.zshrc → ~/.zshrc.bak"
    fi
}

# ── zsh (Linux / WSL) ─────────────────────────────────────────────────────────
install_zsh() {
    info "Installing zsh..."
    sudo apt update && sudo apt install -y zsh
    chsh -s "$(which zsh)"
    warn "Log out and back in (or restart WSL) for the shell change to take effect."
}

# ── Homebrew (macOS) ──────────────────────────────────────────────────────────
install_homebrew() {
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# ── iTerm2 (macOS) ────────────────────────────────────────────────────────────
install_iterm2() {
    info "Installing iTerm2..."
    brew install --cask iterm2
}

# ── Nerd / Powerline Fonts ────────────────────────────────────────────────────
install_fonts() {
    info "Installing Powerline fonts..."
    if [[ "$OS" == "macos" ]]; then
        git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline-fonts
        /tmp/powerline-fonts/install.sh
        rm -rf /tmp/powerline-fonts
    else
        sudo apt install -y fonts-powerline
    fi
}

# ── Oh-my-zsh ─────────────────────────────────────────────────────────────────
install_ohmyzsh() {
    info "Installing Oh-my-zsh..."
    # RUNZSH=no  — don't start a new zsh session after install
    # CHSH=no    — don't change the default shell (already handled separately)
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sed_inplace 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
}

# ── Oh-my-zsh Plugins ─────────────────────────────────────────────────────────
install_ohmyzsh_plugins() {
    info "Installing Oh-my-zsh plugins..."
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting \
        "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    sed_inplace 's/^plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
}

# ── Node.js / nvm ─────────────────────────────────────────────────────────────
install_nvm() {
    info "Installing nvm..."
    if [[ "$OS" == "macos" ]]; then
        brew install nvm
        # append_zshrc ''
        # append_zshrc '# nvm'
        # append_zshrc 'export NVM_DIR="$HOME/.nvm"'
        # append_zshrc '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"'
        # append_zshrc '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"'
    else
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
        # append_zshrc ''
        # append_zshrc '# nvm'
        # append_zshrc 'export NVM_DIR="$HOME/.nvm"'
        # append_zshrc '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
        # append_zshrc '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
    fi
}

# ── Go / gvm ──────────────────────────────────────────────────────────────────
install_gvm() {
    info "Installing gvm prerequisites..."
    if [[ "$OS" == "macos" ]]; then
        brew install bison
    else
        sudo apt update && sudo apt install -y curl git make binutils bison gcc build-essential
    fi
    info "Installing gvm..."
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    # append_zshrc ''
    # append_zshrc '# gvm'
    # append_zshrc '[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"'
}

# ── Python / Miniconda ────────────────────────────────────────────────────────
install_miniconda() {
    info "Installing Miniconda..."
    local installer
    if [[ "$OS" == "macos" ]]; then
        if [[ "$(uname -m)" == "arm64" ]]; then
            installer="Miniconda3-latest-MacOSX-arm64.sh"
        else
            installer="Miniconda3-latest-MacOSX-x86_64.sh"
        fi
    else
        installer="Miniconda3-latest-Linux-x86_64.sh"
    fi
    curl -O "https://repo.anaconda.com/miniconda/$installer"
    bash "$installer" -b
    rm "$installer"
    # ~/miniconda3/bin/conda init zsh
}

# ── Neovim ────────────────────────────────────────────────────────────────────
install_neovim() {
    info "Installing Neovim..."
    mkdir -p ~/.local
    local archive dir
    if [[ "$OS" == "macos" ]]; then
        if [[ "$(uname -m)" == "arm64" ]]; then
            archive="nvim-macos-arm64.tar.gz"
        else
            archive="nvim-macos-x86_64.tar.gz"
        fi
        curl -LO "https://github.com/neovim/neovim/releases/latest/download/$archive"
        xattr -c "$archive"
        tar xzf "$archive"
        dir="${archive%.tar.gz}"
    else
        archive="nvim-linux-x86_64.tar.gz"
        curl -LO "https://github.com/neovim/neovim/releases/latest/download/$archive"
        tar xzf "$archive"
        dir="nvim-linux-x86_64"
    fi
    mv "$dir" ~/.local/nvim
    rm "$archive"
    append_zshrc ''
    append_zshrc '# neovim'
    append_zshrc 'export PATH="$HOME/.local/nvim/bin:$PATH"'
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
    detect_os
    backup_zshrc

    section "Select tools to install"

    if [[ "$OS" != "macos" ]]; then
        ask "Install zsh?"          && install_zsh          || true
    fi

    if [[ "$OS" == "macos" ]]; then
        ask "Install Homebrew?"     && install_homebrew     || true
        ask "Install iTerm2?"       && install_iterm2       || true
    fi

    ask "Install Powerline fonts?"                          && install_fonts            || true
    ask "Install Oh-my-zsh?"                                && install_ohmyzsh          || true
    ask "Install Oh-my-zsh plugins? (requires Oh-my-zsh)"  && install_ohmyzsh_plugins  || true
    ask "Install Node.js via nvm?"                          && install_nvm              || true
    ask "Install Go via gvm?"                               && install_gvm              || true
    ask "Install Python via Miniconda?"                     && install_miniconda        || true
    ask "Install Neovim?"                                   && install_neovim           || true

    section "Done"
    info "Restart your terminal or run: source ~/.zshrc"
}

main