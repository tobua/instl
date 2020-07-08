<p align="center">
  <img src="https://raw.githubusercontent.com/naminho/instl/master/logo.svg?sanitize=true" alt="macos logo" width="300">
  <br>
</p>

# instl

Guide to reinstall macOS optimized for Web Development.

## First Things First

- Backup your data in the Cloud or on a physical drive.
- Startup your mac in Internet Recovery by pressing and holding `⌘⌥R`.
- Go to `Disk Utility` and select `View → Show All Devices` then select the main Apple SSD and click `Erase` with format APFS and GUID scheme.
- Exit `Disk Utility` and format the drive by clicking `Reinstall macOS` in the main menu.
- This will take some time and then follow the instructions making sure to enable encryption when prompted.

## Configuring the System

- Install Updates and enable Auto Update in `⚙️ Software Update`.
- Add applications listed below.
- Remove unused apps from dock and disable `Show recent applications` in dock preferences.
- Edit the Desktop Background in `Settings → Desktop & Screen Saver`.
- Increase mouse tracking speed in `⚙️ Mouse` and enable secondary click if you're using Magic Mouse.
- Make sure Guest Account is disabled in `⚙️ Users & Groups`.

## Applications

- [Chrome](https://www.google.com/chrome/) Browser
- [Lastpass](https://lastpass.com/?&ac=1) Passwords (Synced from Chrome Account)
- [node](https://nodejs.org) JavaScript
- [VS Code](https://code.visualstudio.com/) Code Editor
  - Extensions: Prettier, ESLint, Stylelint, GitLens and FlowJS
- [Sourcetree](https://www.sourcetreeapp.com/) Git

## Application Specific Setup

### npm

- Login: `npm login`
- Global packages without sudo: `sudo chown -R $USER /usr/local/lib/node_modules` & `sudo chown -R $USER /usr/local/bin` (may not be super safe!)
- ncu (Update Dependencies) `npm i -g npm-check-updates`

### React Native

- XCode from App Store
- [AndroidStudio](https://developer.android.com/studio/) Android IDE

### GitHub SSH Key

```
ssh-keygen -t rsa -b 4096 -C "matthias.giger@namics.com"
# Do not enter a passphrase, as this would have to be entered on every commit.
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
# Paste clipboard in GitHub → Settings → SSH Keys → New Key
```

### Shorten Terminal Prompt

This will avoid showing the computer name for every prompt and only the current
folder is displayed. The command will create a `.bash-profile` file.

```
echo "export PS1='\W \$'" >> ~/.bash_profile
```

### Enable Language with Special Characters

Recommended if you frequently switch to a local language requiring special characters. If you only need a few characters every once in a while try pressing and holding the related character `a → 4 → ä` and a menu to select the desired special character will show up.

`Settings → Keyboard → Input Sources → +` then to allow easily switching the layout go to
`Settings → Keyboard → Shortcuts` and under `Input Sources` set `⌥ Space` as the shortcut for next language.

### Prevent Sourcetree package-lock Lag

The package-lock file is generated automatically, but due to it's size and the often huge amount of changes
it bogs down Sourcetree. To prevent this simply ignore the contents of those files in `Preferences → Diff → Ignore File Patterns` and add `, **/package-lock.json`.

## Screenshot of Resulting Setup

<p align="center">
  <img src="https://raw.githubusercontent.com/naminho/instl/master/screenshot.png" alt="screenshot after install">
</p>
