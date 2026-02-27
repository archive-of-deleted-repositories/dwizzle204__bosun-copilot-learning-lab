#!/usr/bin/env bash
set -euo pipefail

log() {
  printf '[cleanup] %s\n' "$*"
}

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

log "Stopping/disabling systemd service if present"
if systemctl list-unit-files | rg -q '^bosun\.service'; then
  sudo systemctl disable --now bosun.service || true
  log "bosun.service disabled/stopped (if it existed)"
else
  log "No bosun.service unit found"
fi

log "Removing local .env files in lab repo"
find "$ROOT_DIR" -maxdepth 3 -type f \( -name '.env' -o -name '.env.*' \) -print -delete || true

log "Removing local state folders created by this lab"
rm -rf "$ROOT_DIR"/.cache "$ROOT_DIR"/logs || true

read -r -p "Uninstall global npm packages 'bosun' and '@openai/codex'? (y/N): " reply
reply="${reply:-N}"
if [[ "$reply" =~ ^[Yy]$ ]]; then
  log "Uninstalling global npm packages"
  npm uninstall -g bosun || true
  npm uninstall -g @openai/codex || true
else
  log "Skipping global npm uninstall"
fi

log "Cleanup complete"
log "Reminder: revoke credentials/tokens manually (GitHub sessions/PAT, Telegram bot token)."
