# path to the OhMyZsh installation.
export ZSH="$HOME/.oh-my-zsh"

# source the OhMyZsh script.
source $ZSH/oh-my-zsh.sh

# update OhMyZsh automatically without asking.
zstyle ':omz:update' mode auto

# set the theme to load.
ZSH_THEME="cypher"

# set the correct date format.
HIST_STAMPS="dd.mm.yyyy"

# PLUGINS

plugins=(
  git
)

# FUNCTIONS

# Usage: gcp <issue_number> <commit_message>
# Wraps the issue number in braces and capitalizes it, then runs git add -p
# and git commit with the formatted issue number and commit message.
# git push is run automatically after the commit, but can be removed if not needed.
function gcp() {
    COMMIT_TYPE=$1
    ISSUE_NUM=$2
    shift
    shift
    COMMIT_MSG=$*
    FORMATTED_ISSUE="$COMMIT_TYPE: $COMMIT_MSG"
    git add -p
    git commit -m "$FORMATTED_ISSUE" -m "issue: SUBS-$ISSUE_NUM"
    git push
}

# ALIASES

# webstorm ide
alias ws="webstorm"

# zsh config file
alias zshconfig="cd ~ && ws .zshrc"

# git status
alias gs="git status"

# git checkout
alias gco="git checkout"

# git checkout branch
alias gcb="git checkout -b"

# git commit and push (from function git_commit_push)
alias gcp="gcp"

# EXPORTS

# homebrew
export PATH="/opt/homebrew/bin:$PATH"

# maestro
export PATH=$PATH:$HOME/.maestro/bin

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# pnpm setup start
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm setup end

# Add RVM to PATH for scripting.
export PATH="$PATH:$HOME/.rvm/bin"

# Add envman to PATH for scripting.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
