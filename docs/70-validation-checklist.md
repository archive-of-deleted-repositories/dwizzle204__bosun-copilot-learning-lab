# 70 - Validation Checklist

Run:

```bash
cd "$HOME/workspace/bosun-copilot-learning-lab"
./scripts/verify_stack.sh
```

Manual checks:

- `node --version` works
- Node major version is 22+ for Copilot executor compatibility
- `npm --version` works
- `gh --version` works
- `gh auth status` shows authenticated session
- `bosun --version` works
- Optional Telegram test message succeeds
- Optional Codex checks (only if installed): `codex --version`, `codex login status`

## Example Captures (Sanitized)

- Step 1 screenshot: `docs/assets/step1-verify-stack-sanitized.png`
- Step 2 screenshot: `docs/assets/step2-bootstrap-sanitized.png`
