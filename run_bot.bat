@echo off
title ADAMCORP Discord License Bot Runner
echo ==========================================
echo Starting ADAMCORP License Key Discord Bot
echo ==========================================
echo.

:: Automatically check and install requirements
echo Verifying dependencies...
python -m pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Python is not installed or not added to your system PATH.
    echo Please install Python 3.10+ and check "Add Python to PATH" during setup.
    echo.
    pause
    exit /b
)

:: Check if .env exists
if not exist .env (
    echo.
    echo [WARNING] No .env file found!
    echo Creating .env from .env.example...
    copy .env.example .env
    echo.
    echo [ACTION REQUIRED] Please edit .env with your DISCORD_TOKEN before starting!
    echo.
    pause
    exit /b
)

echo.
echo Launching Discord License Bot...
echo Keep this window open to stay online!
echo.
python bot.py

echo.
echo Bot has been stopped.
pause
