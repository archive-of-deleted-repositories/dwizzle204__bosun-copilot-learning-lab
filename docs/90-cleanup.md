# 90 - Cleanup / Uninstall

This lab includes a guided cleanup script.

## Run Cleanup Script

```bash
cd "$HOME/workspace/bosun-copilot-learning-lab"
./scripts/cleanup_everything.sh
```

What it does:
- Stops/disables `bosun.service` if present
- Removes local `.env` files in this lab
- Optionally uninstalls global npm packages (`bosun`, `@openai/codex`) after y/n confirmation
- Removes local lab-generated state folders

## Manual Token Revoke Reminder

After cleanup, revoke tokens manually:
- GitHub token/session
- Telegram bot token (regenerate via BotFather if needed)

## Optional Manual Commands

```bash
gh auth logout
```
