<p align="center">
  <img src="https://raw.githubusercontent.com/naminho/instl/master/logo.svg?sanitize=true" alt="macos logo" width="300">
  <br>
</p>

# instl

Things for Frontend Development to install after setting up a fresh macOS installation.

## First Things First

Edit the Desktop Background in `Settings → Desktop & Screen Saver`. Remove unnecessary applications from the Dock. Make sure FileVault is turned on in `Settings → Security & Privacy`.

## Applications

* [Chrome](https://www.google.com/chrome/) Browser
* [Lastpass](https://lastpass.com/?&ac=1) Passwords (Synced from Chrome Account)
* [node](https://nodejs.org) JavaScript
* [Atom](https://atom.io/) Code
  * [Essential UI](https://atom.io/themes/essential-ui) Theme
  * [Editorconfig](https://atom.io/packages/editorconfig) Indentation
* [Sourcetree](https://www.sourcetreeapp.com/) Git
* [Sketch](https://www.sketchapp.com/) Design
* [Principle](http://principleformac.com/) Animations

## npm

* Login: `npm login`
* ncu (Update Dependencies) `npm i -g npm-check-updates`

## React Native

* XCode from App Store
* [AndroidStudio](https://developer.android.com/studio/) Android IDE

## Configuration

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

### Disable Guest Account

`Settings → Users & Groups` Unlock on Bottom Left and then turn of Guest Access for safety reasons.

### Enable Secondary Keyboard Layout

`Settings → Keyboard → Input Sources → +` then to allow easily switching the layout go to
`Settings → Keyboard → Shortcuts` and under `Input Sources` set `⌥ Space` as the shortcut for next language.

### Prevent Sourcetree package-lock Lag

The package-lock file is generated automatically, but due to it's size and the often huge amount of changes
it bogs down Sourcetree. To prevent this simply ignore the contents of those files in `Preferences → Diff → Ignore File Patterns` and add `, **/package-lock.json`.

## Screenshot of Resulting Setup

<p align="center">
  <img src="https://raw.githubusercontent.com/naminho/instl/master/screenshot.png" alt="screenshot after install">
</p>
