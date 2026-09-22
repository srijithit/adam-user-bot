# ADAMCORP License Key Generator & Management Bot

A modern, secure Discord bot built in Python using `discord.py` featuring an interactive control panel (`/panel`), pop-up modals, SQLite database persistence, and 24/7 Render.com deployment readiness.

---

## Features

- **Interactive Control Panel (`/panel`)**:
  - 🟢 **Generate Key**: Pop-up modal to assign custom username (or auto-generate).
  - 🔵 **Key Info**: Query key status, assigned username, and creation date.
  - 🔴 **Delete Key**: Revoke and delete keys from database.
- **Role Enforcement**: Requires **Reseller** role or Administrator permissions.
- **SQLite Persistence (`licenses.db`)**: Saves keys across bot reboots with automatic schema migration.
- **Cryptographic Randomness**: Uses Python's `secrets` module to generate unguessable keys (`ADAMCORP-XXXXX`).

---

## Files Included

- [bot.py](bot.py) - Main Discord bot code.
- [requirements.txt](requirements.txt) - Dependencies (`discord.py`, `python-dotenv`).
- [run_bot.bat](run_bot.bat) - One-click Windows runner script.
- [render.yaml](render.yaml) - Render.com Blueprint configuration.
- [Procfile](Procfile) - Render process declaration.
- [DEPLOYMENT_RENDER.md](DEPLOYMENT_RENDER.md) - Step-by-step 24/7 Render deployment guide.

---

## 24/7 Hosting on Render.com

For step-by-step instructions on deploying your bot to Render.com for 24/7 free hosting, see the [Render Deployment Guide](DEPLOYMENT_RENDER.md).
