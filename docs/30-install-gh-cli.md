# 30 - Install GitHub CLI

## Install

```bash
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install -y wget)) \
  && sudo mkdir -p -m 755 /etc/apt/keyrings \
  && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg \
  | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null \
  && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
  | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null \
  && sudo apt update \
  && sudo apt install -y gh
```

## Authenticate (Preferred)

```bash
gh auth login
gh auth status
```

## Set Git to Use `gh` Credentials

```bash
gh auth setup-git
```

## PAT Fallback

If OAuth is blocked:

```bash
gh auth login --with-token < <(printf '%s' "$GITHUB_TOKEN")
```

## Official Docs

```text
https://cli.github.com/manual/
https://cli.github.com/manual/gh_auth_login
https://cli.github.com/manual/gh_auth_status
```
