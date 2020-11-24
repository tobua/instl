<p align="center">
  <img src="https://raw.githubusercontent.com/naminho/instl/master/screenshot.png" alt="Screenshot after installation">
</p>

# instl

Guide to reinstall the latest macOS optimized for Web Development.

## First Things First

- Backup your data in the Cloud or on a physical drive.
- Startup your mac in Internet Recovery by pressing and holding **⌘⌥R**.
- Go to `Disk Utility` and select `View → Show All Devices` then select the main Apple SSD and click `Erase` with format APFS and GUID scheme.
- Exit `Disk Utility` and format the drive by clicking `Reinstall macOS` in the main menu.
- This will take some time and then follow the instructions making sure to enable encryption when prompted.

## Configuring the System

- Install Updates and enable Auto Update in `⚙️ Software Update` settings.
- Add applications listed below.
- Remove unused apps from dock and disable `Show recent applications` in dock preferences.
- Edit the Desktop Background in `⚙️ Desktop & Screen Saver`.
- Increase mouse tracking speed in `⚙️ Mouse` and enable secondary click if you're using Magic Mouse.
- Make sure Guest Account is disabled in `⚙️ Users & Groups`.
- In `⚙️ Mission Control → Hot Corners...` add Mission Control to Bottom Right and Desktop to Bottom Left.
- `⚙️ Energy Saver` increase time until display turns off when on power.

## Applications

- [Chrome](https://www.google.com/chrome/) Browser
  - [Lastpass Extension](https://lastpass.com/?&ac=1) Passwords (Extensions usually synchronized from Google Account after signing in into Chrome)
- [node](https://nodejs.org) JavaScript
- [VS Code](https://code.visualstudio.com/) Code Editor
- [Sourcetree](https://www.sourcetreeapp.com/) Git

## Application Specific Setup

### Terminal

This will avoid showing the computer name for every prompt and only the current
folder is displayed. The command will create a `.zshrc` file in the user root folder.

```
echo "export PS1='→ '" >> ~/.zshrc
```

It will take a restart for this to take effect, for an immediate result load the file now with `source ~/.zshrc`. In between the single quotation marks you can add whatever, usually a `$` sign is used.

### npm

- Login: `npm login`
- Global packages without sudo: `sudo chown -R $USER /usr/local/lib/node_modules` & `sudo chown -R $USER /usr/local/bin` (may not be super safe!)
- Useful everyday commands `npm i -g epic-cli`

### VS Code

- Extensions: Prettier, ESLint, Stylelint.
- Theme: **⌘KT** and select `Light+`.
- Configuration: Disable `View → Appearance → Show Status Bar`, `View → Show Minimap` and `View → Show Breadcrumbs`.
- Terminal: **⌘J** to toggle the terminal.
- Prettier: Go to settings with **⌘,** search for `Format On Save` and check the box. This way the code will be prettified automatically on each save of a file.
- Remove line numbers: `Settings → Line Numbers` off, uncheck `Folding` and uncheck `Glyph Margin`.

### Sourcetree

Ignore connecting during startup and then go to the `Remote` tab and click connect. Add your GitHub account, which will automatically connect when you're already logged in in the browser. Generate a SSH key and `Save`. If cloning the repositories in the `Remote` tab doesn't work go back to `Preferences` and edit the account by switching the protocol to HTTPS, this will keep the key to commit but clone in SourceTree without issues.

In order to be able to use the generated SSH key also from Terminal make sure to checkout repositories with SSH.

#### Prevent Sourcetree package-lock Lag

The package-lock file is generated automatically, but due to it's size and the often huge amount of changes
it bogs down Sourcetree. To prevent this simply ignore the contents of those files in `Preferences → Diff → Ignore File Patterns` and add `, **/package-lock.json`.

### React Native

- XCode from App Store
- [AndroidStudio](https://developer.android.com/studio/) Android IDE
- Flow Language Support Extension in VSCode

### Enable Language with Special Characters

Recommended if you frequently switch to a local language requiring special characters. If you only need a few characters every once in a while try pressing and holding the related character `a → 4 → ä` and a menu to select the desired special character will show up.

`Settings → Keyboard → Input Sources → +` then to allow easily switching the layout go to
`Settings → Keyboard → Shortcuts` and under `Input Sources` set **⌥Space** as the shortcut for next language.

## Usage

- Press **⌘⇧.** to show hidden files temporarly in Finder.
