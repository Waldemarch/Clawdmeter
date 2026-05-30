# Start the Claude usage daemon on Windows.
# Reads credentials from %USERPROFILE%\.claude\.credentials.json
# and pushes usage data to the ESP32 over BLE.
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Python = "$ScriptDir\daemon\.venv\Scripts\python.exe"
$Daemon = "$ScriptDir\daemon\claude_usage_daemon.py"

if (-not (Test-Path $Python)) {
    Write-Host "venv not found. Run setup first:" -ForegroundColor Red
    Write-Host "  cd daemon; python -m venv .venv; .venv\Scripts\pip install bleak httpx"
    exit 1
}

Write-Host "Starting Claude usage daemon..." -ForegroundColor Green
& $Python $Daemon
