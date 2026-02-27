#!/usr/bin/env bash
set -euo pipefail

log() {
  printf '[install_prereqs] %s\n' "$*"
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    log "Missing required command: $1"
    exit 1
  }
}

log "Updating apt index"
sudo apt-get update -y

log "Installing base packages"
sudo apt-get install -y curl ca-certificates gnupg git jq

if ! command -v node >/dev/null 2>&1; then
  log "Node.js not found, installing Node.js 22.x via NodeSource"
  curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
  sudo apt-get install -y nodejs
else
  log "Node.js already installed: $(node --version)"
fi

if ! command -v gh >/dev/null 2>&1; then
  log "Installing GitHub CLI"
  (type -p wget >/dev/null || sudo apt-get install -y wget)
  sudo mkdir -p -m 755 /etc/apt/keyrings
  wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null
  sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
  sudo apt-get update -y
  sudo apt-get install -y gh
else
  log "GitHub CLI already installed: $(gh --version | head -n1)"
fi

require_cmd node
require_cmd npm
require_cmd gh

log "Done. Next: install Codex CLI and Bosun with npm global commands."
