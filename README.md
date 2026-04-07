# My Develop Tools Configuration

## MacOS

### Package Manager

#### Homebrew
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
Install via Homebrew:
```sh
brew install --cask iterm2
```
- Select a color theme: [Material Design](https://github.com/MartinSeeler/iterm2-material-design) or [Gruvbox](https://github.com/herrbischoff/iterm2-gruvbox)
- Install Nerd Font (required for Powerline):
  ```sh
  curl -fLo "Droid Sans Mono Nerd Font Complete.otf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
  ```

### Shell

#### zsh
zsh is the default shell on macOS now

#### Oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
Set theme in `~/.zshrc`:
```
ZSH_THEME="agnoster"
```

#### Oh-my-zsh plugins
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


### Node.js (nvm)

Install nvm via Homebrew:
```sh
brew install nvm
```
Add to `~/.zshrc`:
```
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
```
Common commands:
```sh
nvm install --lts       # install latest LTS version
nvm use --lts           # use latest LTS version
nvm ls                  # list installed versions
```

---

## Linux

### Shell

#### zsh
Install zsh and set as default shell:
```sh
sudo apt update && sudo apt install -y zsh
chsh -s $(which zsh)
```
Log out and back in for the change to take effect.

#### Oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
Set theme in `~/.zshrc`:
```
ZSH_THEME="agnoster"
```
Install Powerline fonts for the agnoster theme:
```sh
sudo apt install -y fonts-powerline
```

#### Oh-my-zsh plugins
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

### Node.js (nvm)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```
Add to `~/.zshrc`:
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```
Common commands:
```sh
nvm install --lts       # install latest LTS version
nvm use --lts           # use latest LTS version
nvm ls                  # list installed versions
```

---

## Windows (WSL)

### Shell

#### zsh
Install zsh and set as default shell:
```sh
sudo apt update && sudo apt install -y zsh
chsh -s $(which zsh)
```
Restart the WSL terminal for the change to take effect.

#### Oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
Set theme in `~/.zshrc`:
```
ZSH_THEME="agnoster"
```

#### Oh-my-zsh plugins
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

### Node.js (nvm)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```
Add to `~/.zshrc`:
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```
Common commands:
```sh
nvm install --lts       # install latest LTS version
nvm use --lts           # use latest LTS version
nvm ls                  # list installed versions
```
