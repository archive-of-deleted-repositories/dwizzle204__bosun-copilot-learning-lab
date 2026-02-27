# bosun-copilot-learning-lab

Beginner-friendly Ubuntu lab for learning how to run Bosun with GitHub Copilot executor (via `gh` auth), optional Codex CLI usage, and Telegram status notifications.

This lab is safe-by-default:
- No auto-merge
- No destructive Terraform actions
- Telegram is status-only
- Cleanup steps included

Field notes from validated POC:
- Use Node 22+ for Copilot executor stability (`node:sqlite` runtime dependency).
- Bosun Codex autonomous execution may require API-key runtime, even if Codex CLI OAuth login works interactively.
- Bosun setup may write global config to `~/bosun/.env`; check it when troubleshooting unexpected executor behavior.

## Lab Path (Read in Order)

1. [docs/00-overview.md](docs/00-overview.md)
2. [docs/10-prereqs.md](docs/10-prereqs.md)
3. [docs/20-install-copilot.md](docs/20-install-copilot.md)
4. [docs/30-install-gh-cli.md](docs/30-install-gh-cli.md)
5. [docs/40-install-bosun.md](docs/40-install-bosun.md)
6. [docs/50-telegram-notifications.md](docs/50-telegram-notifications.md)
7. [docs/60-run-as-a-service.md](docs/60-run-as-a-service.md)
8. [docs/70-validation-checklist.md](docs/70-validation-checklist.md)
9. [docs/80-troubleshooting.md](docs/80-troubleshooting.md)
10. [docs/90-cleanup.md](docs/90-cleanup.md)

## Quick Commands

```bash
cd "$HOME/workspace/bosun-copilot-learning-lab"
./scripts/install_prereqs.sh
./scripts/verify_stack.sh
```

## Upstream References

```text
https://github.com/virtengine/bosun
https://bosun.virtengine.com/
https://developers.openai.com/codex/cli/
https://developers.openai.com/codex/auth/
https://developers.openai.com/codex/cli/reference/
https://cli.github.com/manual/
https://core.telegram.org/bots/tutorial
https://core.telegram.org/bots/api
```

## Next Steps

1. Run through docs in order on a fresh Ubuntu test box.
2. Copy `templates/env.example` to a local `.env` only when needed.
3. When done, run `./scripts/cleanup_everything.sh`.

## Validation Screenshots

See sanitized examples in `docs/assets/`:
- `docs/assets/step1-verify-stack-sanitized.png`
- `docs/assets/step2-bootstrap-sanitized.png`
