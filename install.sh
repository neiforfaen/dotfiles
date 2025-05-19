#!/bin/bash

# set current file directory
SCRIPT_DIR=$(dirname "$0")

# get name and email for git config
read -p "Enter your name for git config: " GIT_NAME
read -p "Enter your email for git config: " GIT_EMAIL

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
cp -f "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"

# cleanup comments and whitespace
sed -i '' '/^\s*#/d;/^\s*$/d' "$HOME"/.zshrc

echo "Zsh config installed! Reload with 'source ~/.zshrc' or '. ~/.zshrc'"

# create a new .gitconfig file
echo "Creating new .gitconfig file..."
rm -rf "$HOME/.gitconfig"
touch "$HOME/.gitconfig"

# copy config file to ~/.gitconfig
echo "Copying config file to ~/.gitconfig..."
cp -f "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"

# copy name and email to .gitconfig
echo "Copying name and email to .gitconfig..."
sed -i '' "s/<NAME>/$GIT_NAME/g" "$HOME"/.gitconfig
sed -i '' "s/<EMAIL>/$GIT_EMAIL/g" "$HOME"/.gitconfig

# delete zed config
if [ -d "$HOME/.config/zed" ]; then
  echo "Deleting existing zed config..."
  rm -rf "$HOME/.config/zed"
fi

# create zed config directory
mkdir -p "$HOME/.config/zed"

# copy zed config
echo "Copying zed config..."
cp -rf "$SCRIPT_DIR/.config/zed/." "$HOME/.config/zed"

# delete karabiner config
if [ -d "$HOME/.config/karabiner" ]; then
    echo "Deleting existing karabiner config..."
    rm -rf "$HOME/.config/karabiner"
fi

# create karabiner config directory
mkdir -p "$HOME/.config/karabiner"

# copy karabiner config
echo "Copying zed config..."
cp -rf "$SCRIPT_DIR/.config/karabiner/." "$HOME/.config/karabiner"
