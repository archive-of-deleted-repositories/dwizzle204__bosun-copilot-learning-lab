# 40 - Install Bosun

## Install Bosun Globally

```bash
npm i -g bosun
bosun --version
```

If global install fails with `EACCES` on Ubuntu, use user-local install:

```bash
npm i -g bosun --prefix "$HOME/.npm-global"
export PATH="$HOME/.npm-global/bin:$PATH"
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
bosun --version
```

## Initialize

Upstream Bosun README documents setup support:

```bash
bosun --setup
```

Headless alternative:

```bash
bosun --setup-terminal
```

## Where `.env` Lives

For a repo-level setup, `.env` is created in your project root (for example `/home/ubuntu/my-repo/.env`).

Bosun setup may also write global config at:

- `~/bosun/.env`
- `~/bosun/bosun.config.json`

If behavior is unexpected, verify both repo `.env` and global `~/bosun/.env`.

## Secret Safety

- Keep `.env` local only.
- Add `.env` and `.env.*` to `.gitignore`.
- Do not paste bot tokens in logs, issues, or commits.

## Upstream Sources Used

Derived from:
- Bosun README quickstart (`bosun --setup`)
- Bosun `.env.example` variable names
- Bosun setup portal docs

## Field-Proven Notes

- Bosun + Copilot executor worked reliably after upgrading runtime to Node 22.
- In this tested setup, Bosun Codex execution required API-key-based runtime for autonomous task execution (CLI OAuth alone was not enough).

## Official Docs

```text
https://github.com/virtengine/bosun
https://bosun.virtengine.com/
```
