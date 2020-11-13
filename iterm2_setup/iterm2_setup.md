## iTerm2 Mac setup

1. install by homwbrew

    ```
    $ brew cask install iterm2
    ```

2. select color theme

    Solarized Dark theme：http://ethanschoonover.com/solarized

    Material Design theme: https://github.com/MartinSeeler/iterm2-material-design

3. install Oh My Zsh

    ```
    $ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

    Then setup zsh as default shell:

    ```
    $ chsh -s /bin/zsh
    ```

4. setup zsh theme

    ```
    vim ~/.zshrc
    ```

    Set ZSH_THEME="agnoster"

5. Download font

    Meslo font: https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf

6. setup zsh-syntax-highlighting

    ```
    $ brew install zsh-syntax-highlighting
    ```

    安装成功之后，编辑vim ~/.zshrc文件，在最后一行增加下面配置：
 
    ```
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ```

7. auto suggestion

    ```
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    ```
