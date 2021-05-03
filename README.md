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

- Increase mouse tracking speed in `⚙️ Mouse` and enable secondary click if you're using Magic Mouse.
- Remove unused apps from dock and disable `Show recent applications` in dock preferences.
- Edit the Desktop Background in `⚙️ Desktop & Screen Saver`.
- In `⚙️ Mission Control → Hot Corners...` add Mission Control to Bottom Right and Desktop to Bottom Left.
- `⚙️ Battery` increase time until display turns off when on `Power Adapter`.
- Install Updates and enable Auto Update in `⚙️ Software Update` settings.
- Make sure Guest Account is disabled in `⚙️ Users & Groups`.

## Applications

- [Chrome](https://www.google.com/chrome/) Browser
- [node](https://nodejs.org) JavaScript
- [VS Code](https://code.visualstudio.com/) Code Editor
  - Move to the Applications folder before opening.
- [Sourcetree](https://www.sourcetreeapp.com/) Git
  - Not yet signed by Apple: After an unsuccessful try to open it go to `⚙️ Security & Privacy` and click `Open Anyways` 😱.

## Application Specific Setup

### Terminal

Run the following in the Terminal to avoid showing the computer name for every prompt. The command will create a `.zshrc` file in the user root folder. In between the single quotation marks you can add whatever you prefer. Restart the Terminal for the changes to take effect.

```
echo "export PS1='→ '" >> ~/.zshrc
```

### npm

- Login: `npm login`
- `[sudo] npm i -g epic-cli` [epic-cli](http://github.com/tobua/epic-cli) provides useful everyday commands.
- Installing global packages without sudo: `sudo chown -R $USER /usr/local/lib/node_modules` & `sudo chown -R $USER /usr/local/bin` (installing global packages with sudo may be the safer option!)

### VS Code

- Extensions **⇧⌘X**: Install the following
  - Prettier
  - ESLint
  - Stylelint (also works with CSS-in-JS)
- Theme **⌘KT**: and select `Light+`.
- Layout: Disable `View → Show Minimap`, `View → Show Breadcrumbs`, `View → Appearance → Show Activity Bar` (**⇧⌘F** to search **⇧⌘E** for files) and `View → Appearance → Show Status Bar` (If any of the extensions don't work check the status bar).
- Settings **⌘[Comma]**: Check `Text Editor → FormattingText Editor → Format On Save` to format the code with the Prettier extension.
  - 🥷 Mode: Turn `Text Editor → Line Numbers` off, uncheck `Text Editor → Folding` and uncheck `Text Editor → Glyph Margin`. Click the dots next to explorer on the top-left and uncheck all.
- Usage
  - Toggle the Terminal with **⌘J**.
  - Select multiple cursors with **⌥[Click]**.

### Sourcetree

Ignore connecting during startup and then go to the `Remote` tab and click connect. Add your GitHub account, which will automatically connect when you're already logged in in the browser. Generate a SSH key and `Save`. In order to be able to checkout with SSH go to the Terminal and clone a repository with (install developer tools when prompted)

```
git clone git@github.com:[username]/[repository].git
```

enter `yes` to add GitHub to known hosts. If it still fails try this and clone again.

```
ssh-add -K ~/.ssh/[GitHub-Username]-GitHub
```

After that you can clone and commit from both SourceTree and the CLI.

#### Prevent Sourcetree package-lock Lag

The package-lock file is generated automatically, but due to it's size and the often huge amount of changes
it bogs down Sourcetree. To prevent this simply ignore the contents of those files in `Preferences → Diff → Ignore File Patterns` and add `, **/package-lock.json`.

### React Native

- XCode from App Store
- [AndroidStudio](https://developer.android.com/studio/) Android IDE
- Flow Language Support Extension in VS Code

### Enable Language with Special Characters

Recommended if you frequently switch to a local language requiring special characters. If you only need a few characters every once in a while try pressing and holding the related character `a → 4 → ä` and a menu to select the desired special character will show up.

`Settings → Keyboard → Input Sources → +` then to allow easily switching the layout go to
`Settings → Keyboard → Shortcuts` and under `Input Sources` set **⌥Space** as the shortcut for next language.

## Usage

- Press **⌘⇧.** to show hidden files temporarly in Finder.

## Testing in Windows Browsers

To test websites in Internet Explorer 11 or Edge download [VirtualBox](https://www.virtualbox.org/) along with a free testing Windows image from the Microsoft [Modern IE](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/) initiative. Once the image is imported and running you can access the Mac's localhost through the `10.0.2.2` IP address, so localhost:3000 becomes http://10.0.2.2:3000.
