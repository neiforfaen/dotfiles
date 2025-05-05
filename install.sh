#!/bin/bash

# set up OhMyZsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh not found. Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# backup existing config
if [ -f "$HOME/.zshrc" ]; then
  if [ ! -f "$HOME/.zshrc.bak" ]; then
    echo "Backing up existing .zshrc to .zshrc.bak"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
  else
    echo ".zshrc.bak already exists, skipping backup."
  fi
fi

# create a new .zshrc file
echo "Creating new .zshrc file..."
rm -rf "$HOME/.zshrc"
touch "$HOME/.zshrc"

# copy config file to ~/.zshrc
echo "Copying config file to ~/.zshrc..."
cp -f ./zshrc "$HOME/.zshrc"

# cleanup comments and whitespace
sed -i '' '/^\s*#/d;/^\s*$/d' "$HOME"/.zshrc

echo "Zsh config installed! Reload with 'source ~/.zshrc' or '. ~/.zshrc'"