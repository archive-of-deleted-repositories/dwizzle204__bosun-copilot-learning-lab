# 10 - Prerequisites

## Target

- Ubuntu 22.04+ (server or desktop)
- `sudo` access
- Git installed
- Internet access

## Install Base Packages

```bash
sudo apt-get update
sudo apt-get install -y curl ca-certificates gnupg git jq
```

## Install Node.js + npm (NodeSource)

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs
node --version
npm --version
```

## No-sudo Alternative (nvm)

```bash
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"
nvm install 22
nvm alias default 22
node --version
npm --version
```

## Optional: Run Scripted Installer

```bash
cd "$HOME/workspace/bosun-copilot-learning-lab"
./scripts/install_prereqs.sh
```
