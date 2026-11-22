@echo off
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
  echo Python environment missing. Please follow README.md.
  pause
  exit /b 1
)
echo Preview URL: http://127.0.0.1:8000/
echo Keep this window open. Press Ctrl+C to stop.
".venv\Scripts\python.exe" -m mkdocs serve --dev-addr 127.0.0.1:8000
pause
