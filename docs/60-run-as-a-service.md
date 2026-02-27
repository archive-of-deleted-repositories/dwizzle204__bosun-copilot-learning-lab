# 60 - Run Bosun as a systemd Service (Optional)

## Copy Template and Edit

```bash
sudo cp "$HOME/workspace/bosun-copilot-learning-lab/templates/systemd/bosun.service.example" /etc/systemd/system/bosun.service
sudo nano /etc/systemd/system/bosun.service
```

Adjust these paths:
- `User=`
- `WorkingDirectory=`
- `EnvironmentFile=`

## Enable Service

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now bosun.service
sudo systemctl status bosun.service --no-pager
```

## Stop Service

```bash
sudo systemctl disable --now bosun.service
```
