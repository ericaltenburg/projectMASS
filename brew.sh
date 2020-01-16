#!/usr/bin/env bash

echo "Testing to see if Homebrew is installed: "
if test ! $(which brew); then
	echo "Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
	echo "Homebrew is installed."
fi

# Install Brew Packages
brew install python
brew install tree
brew install zsh
brew install zsh-syntax-highlighting

# Install MacOS applications
brew cask install iterm2
brew cask install google-chrome
brew cask install sublime-text
brew cask install spotify
brew cask install skype
brew cask install mactex
brew cask install slack
brew cask install alfred
brew cask install macupdater
brew cask install virtualbox
brew cask install gyazo
brew cask install intellij-idea
brew cask install scroll-reverser
# Microsoft Office if you have a subscription
brew cask install microsoft-office

# Install Fira Code Font
brew tap homebrew/cask-fonts
brew cask install font-fira-code
