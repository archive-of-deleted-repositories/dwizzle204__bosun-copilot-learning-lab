# 50 - Telegram Notifications (Status Only)

Use Telegram for lightweight status updates. Keep it secondary to local logs and PRs.

## 1) Create a Bot

1. Open Telegram and message `@BotFather`
2. Run `/newbot`
3. Save the bot token

## 2) Configure Env Vars

Use project `.env`:

```dotenv
TELEGRAM_BOT_TOKEN=replace_me
TELEGRAM_CHAT_ID=replace_me
```

## 3) Test with Bot API (Helper Script Style)

```bash
curl -sS -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
  -d chat_id="${TELEGRAM_CHAT_ID}" \
  -d text="bosun-copilot-learning-lab: telegram test"
```

## 4) Bosun Native Note

Upstream Bosun docs and `.env.example` include native `TELEGRAM_BOT_TOKEN` and `TELEGRAM_CHAT_ID` support.

## Official Docs

```text
https://core.telegram.org/bots/tutorial
https://core.telegram.org/bots/api
```
