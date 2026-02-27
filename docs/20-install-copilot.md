# 20 - Install Copilot Executor (Preferred)

## Primary Path for This Lab

Bosun Copilot executor uses your GitHub CLI auth session.

```bash
gh auth status
```

If not logged in:

```bash
gh auth login
gh auth setup-git
```

## Optional: Install Codex CLI for Local Interactive Testing

Codex CLI is optional in this Copilot-first lab.

```bash
npm i -g @openai/codex
codex --version
codex login
# headless fallback
codex login --device-auth
codex login status
```

Note: In this validated POC, Bosun autonomous Codex execution required API-key runtime, while interactive CLI OAuth worked locally.

## Official Docs

```text
https://developers.openai.com/codex/cli/
https://developers.openai.com/codex/auth/
https://developers.openai.com/codex/cli/reference/
https://cli.github.com/manual/
https://cli.github.com/manual/gh_auth_login
https://cli.github.com/manual/gh_auth_status
```
