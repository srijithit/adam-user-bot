# Deploying Your Discord Bot to Render.com (24/7 Free Hosting)

This guide walks you through deploying your Discord License Key Generator bot to [Render.com](https://render.com) so it stays online 24/7 for free.

Your repository is already pushed to GitHub:
**Repository**: `https://github.com/srijithit/adam-user-bot`

---

## Method 1: Deploy as a Free Web Service (Recommended)

Render offers a **100% Free Plan** for Web Services. The bot includes a built-in lightweight HTTP health endpoint (`aiohttp`) that fulfills Render's port check.

### Step 1: Log in to Render
1. Go to [https://dashboard.render.com](https://dashboard.render.com).
2. Sign in using your GitHub account (`srijithit`).

### Step 2: Create a New Web Service
1. In the Render Dashboard, click the **New +** button in the top right.
2. Select **Web Service**.
3. Choose **Build and deploy from a Git repository**.
4. In the list of repositories, select `adam-user-bot` (or connect your GitHub repository if prompted) and click **Connect**.

### Step 3: Configure Settings
Fill in the configuration fields:

| Field | Value | Notes |
| :--- | :--- | :--- |
| **Name** | `adam-user-bot` | Or any name you like |
| **Region** | Select closest region (e.g., Singapore, Frankfurt, Oregon) | |
| **Branch** | `main` | |
| **Root Directory** | *(leave blank)* | |
| **Runtime** | `Python 3` | |
| **Build Command** | `pip install -r requirements.txt` | Installs dependencies |
| **Start Command** | `python bot.py` | Starts the bot & web health check |
| **Instance Type** | **Free** | Select the Free plan ($0/month) |

### Step 4: Add Environment Variables
Scroll down to the **Environment Variables** section on Render and click **Add Environment Variable**:

| Key | Value | Description |
| :--- | :--- | :--- |
| `DISCORD_TOKEN` | `YOUR_DISCORD_BOT_TOKEN` | Secret bot token from Discord Developer Portal |
| `KEY_PREFIX` | `ADAMCORP` | Prefix for generated keys (e.g. `ADAMCORP-XXXXX`) |
| `KEY_LENGTH` | `5` | Length of random characters in the key |
| `REQUIRED_ROLE_NAME` | `Reseller` | Role name allowed to use `/panel` |
| `GUILD_ID` | *(Optional)* | Your server ID for instant slash command registration |
| `PORT` | `8080` | Port for the HTTP health server (Render default) |

> ⚠️ **IMPORTANT**: Never share or commit your `DISCORD_TOKEN`. Only add it inside Render's Environment Variables dashboard.

### Step 5: Deploy
Click **Create Web Service**.
Render will clone your repository, install `requirements.txt`, start the bot, and bring it online.

---

## Keeping Free Services Online 24/7 (Prevent Sleep)

Render's Free Web Services go to sleep after 15 minutes of inactivity if they receive no HTTP traffic.

To keep your bot running 24/7 for free:
1. Copy the public Render URL assigned to your service (e.g., `https://adam-user-bot.onrender.com`).
2. Go to a free uptime monitor such as:
   - [UptimeRobot.com](https://uptimerobot.com) (Free 5-minute pings)
   - [Cron-job.org](https://cron-job.org)
3. Create a **HTTP (HEAD or GET)** monitor pointing to your URL (`https://adam-user-bot.onrender.com`) every 5 to 10 minutes.
4. Your bot will remain awake 24/7 without shutting down!

---

## Method 2: Deploy Using Render Blueprints (`render.yaml`)

Because your repository contains a pre-configured `render.yaml` Blueprint:
1. In Render Dashboard, click **New +** -> **Blueprint**.
2. Select `adam-user-bot`.
3. Render reads `render.yaml` and sets up the Web Service automatically.
4. Enter your `DISCORD_TOKEN` when prompted and click **Apply**.
