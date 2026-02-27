#!/usr/bin/env bash
set -euo pipefail

log() {
  printf '[verify_stack] %s\n' "$*"
}

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    log "OK: $cmd exists"
  else
    log "MISSING: $cmd"
    return 1
  fi
}

status=0

check_cmd node || status=1
check_cmd npm || status=1
check_cmd gh || status=1
check_cmd bosun || status=1

if command -v node >/dev/null 2>&1; then log "node version: $(node --version)"; fi
if command -v npm >/dev/null 2>&1; then log "npm version: $(npm --version)"; fi

if command -v codex >/dev/null 2>&1; then
  if codex login status >/dev/null 2>&1; then
    log "OK: codex login status succeeded"
  else
    log "WARN: codex login status failed (not logged in yet?)"
  fi
else
  log "INFO: codex not found (optional in Copilot-first lab)"
fi

if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then
    log "OK: gh auth status succeeded"
  else
    log "WARN: gh auth status failed (not logged in yet?)"
    status=1
  fi
fi

if ! command -v bosun >/dev/null 2>&1 && [ -x "$HOME/.npm-global/bin/bosun" ]; then
  log "HINT: bosun exists at $HOME/.npm-global/bin/bosun"
  log "HINT: export PATH=\"$HOME/.npm-global/bin:\$PATH\""
fi

if [ "$status" -eq 0 ]; then
  log "All checks passed"
else
  log "One or more checks failed"
fi

exit "$status"
