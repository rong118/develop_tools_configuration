## Install Homebrew on MacOS as package manager

* [Homebrew Website](https://brew.sh/)

Run below command from macOS Terminal(Need xcode command line tools)

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Common brew command:
- brew list => List all installed formula
- search [text|/text/] => Perform a substring search of cask tokens and formula names
- brew install [formula] => Install formula
- brew uninstall [formula] => Uninstall formula
- brew update => Update Homebrew itself
- brew upgrade [formula] => Update formaula and dependencies
- brew autoremove => Uninstall formulae that are now no longer needed.
- brew casks => List all locally installable casks
- brew pin [formula]
