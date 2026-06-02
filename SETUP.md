# Hybrid Training Dashboard - Setup

One-time setup, then it lives on your phone home screen and updates whenever I push new data through chat.

## 1. Make the GitHub repo (2 min)

1. Go to [github.com/new](https://github.com/new)
2. Repo name: `hybrid-training` (or whatever you want, just remember it)
3. Visibility: **Public** (required for free GitHub Pages)
4. Don't tick "Add a README" or anything else. Empty repo.
5. Hit **Create repository**

GitHub will show you a "quick setup" page with a URL like `https://github.com/yourusername/hybrid-training.git`. Copy that.

## 2. Push the dashboard up (3 min)

Open Terminal, then run these one at a time. Replace `yourusername` with your actual GitHub username.

```bash
cd "/Users/pod88/Documents/Claude/Projects/Hybrid Training/dashboard"
git init
git add -A
git commit -m "Initial dashboard"
git branch -M main
git remote add origin https://github.com/yourusername/hybrid-training.git
git push -u origin main
chmod +x deploy.sh
```

If git asks for credentials, use a personal access token, not your password. Quick way to make one: github.com -> Settings -> Developer settings -> Personal access tokens -> Tokens (classic) -> Generate new token. Tick the `repo` scope. Copy the token and paste it in when prompted as the password.

## 3. Turn on GitHub Pages (1 min)

1. In your new repo on github.com, go to **Settings** (top right of the repo).
2. Left sidebar: **Pages**.
3. Source: **Deploy from a branch**.
4. Branch: **main**, folder **/ (root)**. Save.
5. Wait 30-60 seconds. The page will reload and show a green box with your URL: `https://yourusername.github.io/hybrid-training/`

Open that URL in Safari on your phone.

## 4. Bookmark to home screen (30 sec)

On iPhone, in Safari:

1. Open the URL.
2. Tap the **Share** button (square with arrow up).
3. Scroll down, tap **Add to Home Screen**.
4. Name it "Hybrid" or whatever you like. Tap **Add**.

Now it opens fullscreen like an app. Dark theme, status bar tucked in, no browser chrome.

## 5. Updating the dashboard

Whenever I refresh data or push a program change through chat, I'll update `index.html` in this folder. To ship the update to your phone:

```bash
cd "/Users/pod88/Documents/Claude/Projects/Hybrid Training/dashboard"
./deploy.sh
```

That's it. Wait 30-60s for GitHub Pages to rebuild, then refresh on your phone.

You can also pass a custom commit message:

```bash
./deploy.sh "Add foundation block week 2"
```

## Troubleshooting

**`./deploy.sh: Permission denied`** - Run `chmod +x deploy.sh` once, then it sticks.

**Phone still shows old version after deploy** - Pull-to-refresh in Safari, or force-close the home-screen app and reopen. iOS caches aggressively.

**Page is blank** - GitHub Pages takes a minute on first deploy. If it's still blank after a few minutes, check the repo Settings -> Pages section for any error message.

**Want a custom domain (eg `training.yourdomain.com`)** - In repo Settings -> Pages there's a "Custom domain" field. Point a CNAME at `yourusername.github.io`. Tell me when you've done it and I'll add the `CNAME` file.
