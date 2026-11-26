@echo off
setlocal
chcp 65001 >nul
cd /d "%~dp0"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\upload.ps1"
set "upload_exit=%errorlevel%"
echo.
pause
exit /b %upload_exit%
