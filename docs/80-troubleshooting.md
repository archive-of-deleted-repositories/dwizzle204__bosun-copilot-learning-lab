# 80 - Troubleshooting

## `codex login` fails on headless host

Use:

```bash
codex login --device-auth
```

## `gh auth login` fails in SSH session

Use device/browser flow or PAT fallback in `docs/30-install-gh-cli.md`.

## Bosun setup fails

- Verify `node --version` is 22+ (recommended for Copilot executor compatibility)
- Verify `gh auth status`
- Re-run `bosun --setup-terminal` for headless mode

## `bosun` not found after install

If installed with `--prefix "$HOME/.npm-global"`:

```bash
export PATH="$HOME/.npm-global/bin:$PATH"
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Copilot executor crash: `ERR_UNKNOWN_BUILTIN_MODULE: node:sqlite`

Use Node 22+ and re-run Bosun:

```bash
node --version
```

If needed, install via nvm (see `docs/10-prereqs.md`).

## Bosun keeps using wrong executor settings

Bosun setup can write global settings in `~/bosun/.env`.
Check for conflicting keys there (for example `COPILOT_SDK_DISABLED`, `PRIMARY_AGENT`) if repo-level `.env` appears ignored.

## Codex OAuth works in CLI but Bosun task execution still asks for API key

In this tested setup, Bosun Codex autonomous execution required API-key-based runtime.
If you do not want OpenAI API spend, switch Bosun executor to Copilot.

## Telegram messages not sending

- Re-check `TELEGRAM_BOT_TOKEN`
- Re-check `TELEGRAM_CHAT_ID`
- Send a direct message to bot first, then retry
