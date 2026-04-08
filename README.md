# My Develop Tools Configuration

## macOS Setup

### Homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Common commands:
- `brew install [formula]` — install a package
- `brew uninstall [formula]` — uninstall a package
- `brew update` — update Homebrew itself
- `brew upgrade [formula]` — upgrade a package
- `brew list` — list installed packages
- `brew search [text]` — search packages

### iTerm2
```sh
brew install --cask iterm2
```
- Select a color theme: [Material Design](https://github.com/MartinSeeler/iterm2-material-design) or [Gruvbox](https://github.com/herrbischoff/iterm2-gruvbox)


### Install Nerd Font (required for Powerline):
```sh
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
```

---

## Linux / Windows (WSL) Setup

### zsh
```sh
sudo apt update && sudo apt install -y zsh
chsh -s $(which zsh)
```

### Install Nerd Font (required for Powerline):
```sh
sudo apt install -y fonts-powerline
```

---

## All Platforms

### Oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
Set theme in `~/.zshrc`:
```
ZSH_THEME="agnoster"
```

### Oh-my-zsh Plugins
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
Enable in `~/.zshrc`:
```
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

---

## Node.js (nvm)

### Installation

**macOS** — install via Homebrew:
```sh
brew install nvm
```
Add to `~/.zshrc`:
```
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
```

**Linux / Windows (WSL)** — install via curl:
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```
Add to `~/.zshrc`:
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

### Common Commands
```sh
nvm install --lts       # install latest LTS version
nvm use --lts           # use latest LTS version
nvm ls                  # list installed versions
```

---

## Go (gvm)

### Prerequisites

**macOS:**
```sh
brew install bison
```

**Linux / Windows (WSL):**
```sh
sudo apt update && sudo apt install -y curl git make binutils bison gcc build-essential
```

### Installation (all platforms)
```sh
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```
Add to `~/.zshrc`:
```
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
```

### Common Commands
```sh
gvm listall                    # list all available Go versions
gvm install go1.21             # install a specific version
gvm use go1.21 --default       # use a version and set as default
gvm list                       # list installed versions
```

---

## Python (Miniconda)

### Installation

**macOS (Apple Silicon):**
```sh
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
bash Miniconda3-latest-MacOSX-arm64.sh
```

**Linux / Windows (WSL):**
```sh
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

### Configuration & Common Commands (all platforms)
```sh
conda init zsh
```
Restart the terminal, then:
```sh
conda create -n myenv python=3.11  # create a new environment
conda activate myenv               # activate environment
conda deactivate                   # deactivate environment
conda env list                     # list all environments
conda install <package>            # install a package via conda
pip install <package>              # install a package via pip (inside active env)
```