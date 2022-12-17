<p align="center">
  <img src="https://raw.githubusercontent.com/tobua/instl/main/screenshot.png" alt="Screenshot after installation">
</p>

# instl

Guide to reinstall the latest macOS optimized for Web Development.

## Reinstalling macOS

- Backup your data in the Cloud or on a physical drive.
- Startup your mac in Internet Recovery by pressing and holding **⌘⌥R**.
- Go to `Disk Utility` and select `View → Show All Devices` then select the main Apple SSD and click `Erase` with format APFS and GUID scheme.
- Exit `Disk Utility` and format the drive by clicking `Reinstall macOS` in the main menu.
- This will take some time and then follow the instructions making sure to enable encryption when prompted.

## 🤖 Automatic Configuration Script

The following tasks marked with 🤖 can be automated by running the `run.sh` found in this repository.

```sh
curl https://raw.githubusercontent.com/tobua/instl/main/run.sh -o run.sh
sh run.sh
# Follow instructions in script and then restart to run again with sudo.
sudo sh run.sh
```

## Configuring the System

- Open `⚙️ System Preferences` and sign in to your Apple ID.
- 🤖 Increase mouse tracking speed in `⚙️ Mouse` and enable secondary click if you're using Magic Mouse.
- Remove unused apps from dock and 🤖 disable `Show recent applications` in dock preferences.
- 🤖 In `⚙️ Mission Control → Hot Corners...` add Mission Control to Bottom Right and Desktop to Bottom Left.
- 🤖 `⚙️ Battery` increase time until display turns off when on `Power Adapter`.
- 🤖 Install Updates and enable `Automatically keep my Mac up to date` in `⚙️ Software Update` settings.
- Edit the Desktop Background in `⚙️ Desktop & Screen Saver`.
- Make sure Guest Account is disabled in `⚙️ Users & Groups`.
- In `⚙️ Security & Privacy` enable unlocking with Apple Watch.

### Optional: Input Language with Special Characters

Recommended if you frequently switch to a local language requiring special characters. If you only need a few characters every once in a while try pressing and holding the related character `a → 4 → ä` and a menu to select the desired special character will show up. If this isn't enough go to `⚙️ Keyboard → Input Sources` and press `+` to add another input language. To easily switch the input language layout go to `⚙️ Keyboard → Shortcuts` and under `Input Sources` set **⌥Space** as the shortcut for next language.

## Applications

- 🤖 [Chrome](https://www.google.com/chrome/) Browser
- 🤖 [node](https://nodejs.org) JavaScript
- 🤖 [VS Code](https://code.visualstudio.com/) Code Editor
  - Move to the Applications folder before opening.
- 🤖 [Sourcetree](https://www.sourcetreeapp.com/) Git
  - Not yet signed by Apple: After an unsuccessful try to open it go to `⚙️ Security & Privacy` and click `Open Anyways` 😱.

## Application Specific Setup

### 🤖 Terminal

Run the following in the Terminal to avoid showing the computer name for every prompt. The command will create a `.zshrc` file in the user root folder. In between the single quotation marks you can add whatever you prefer. Restart the Terminal for the changes to take effect.

```
echo "export PS1='→ '" >> ~/.zshrc
```

### 🤖 npm

- `[sudo] npm i -g epic-cli` [epic-cli](http://github.com/tobua/epic-cli) provides useful everyday commands.

### VS Code

- 🤖 Extensions **⌘⇧X**: Install the following
  - Prettier
  - ESLint
- 🤖 Theme **⌘KT**: and select `Light+`.
- 🤖 Layout: Disable `View → Show Minimap`, `View → Show Breadcrumbs`, `View → Appearance → Show Activity Bar` and `View → Appearance → Show Status Bar` (If any of the extensions don't work check the status bar).
- 🤖 Settings **⌘[Comma]**:
  - Check `Text Editor → Formatting → Format On Save` to format the code with the Prettier extension.
  - Enable `Text Editor → Bracket Pair Colorization` to better recognize matching nested brackets.
  - 🥷 Mode: Turn `Text Editor → Line Numbers` off, uncheck `Text Editor → Folding` and uncheck `Text Editor → Glyph Margin`. Click the dots next to explorer on the top-left and uncheck all.
- Usage
  - Toggle the Terminal with **⌘J**.
  - Select multiple cursors with **⌥[Click]**.
  - **⌘D** will add another cursor to the next found current selection below.
  - Search with **⌘⇧F** and switch back to the file tree view with **⌘⇧E**.

### Sourcetree

Ignore connecting during startup and then go to the `Remote` tab and click connect. Add your GitHub account, which will automatically connect when you're already logged in in the browser. Logging into GitHub in Chrome make sure to remove existing SSH keys from old installations. Back in Sourcetree generate a new SSH key and `Save`. Checking out won't work until the authenticity of github.com has been confirmed. This can be done in the Terminal and by cloning any repository (install developer tools when prompted)

```
git clone git@github.com:[username]/[repository].git [destination-folder]
```

enter `yes` to add GitHub to known hosts. The following command will ensure the key is available when committing.

```
ssh-add --apple-use-keychain ~/.ssh/[GitHub-Username]-GitHub
```

The SSH key generated by Sourcetree will only be valid for the current session. To push or checkout with Sourcetree run the above again in Terminal after every restart or logout. To avoid running it after every restart it's also possible to add it to `.zshrc` after which the key will be available once the Terminal has opened. Use `sudo vim ~/.zshrc` to edit this file, which has already been created and appended by the `run.sh` script.

```sh
# Load SSH key.
ssh-add -q --apple-use-keychain ~/.ssh/[GitHub-Username]-GitHub
```

## Usage

- Press **⌘⇧.** to show hidden files temporarly in Finder.

## Windows Browsers for Testing

To test websites in Internet Explorer 11 or Edge download [VirtualBox](https://www.virtualbox.org/) along with a free testing Windows image from the Microsoft [Modern IE](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/) initiative. Once the image is imported and running you can access the Mac's localhost through the `10.0.2.2` IP address, so localhost:3000 becomes http://10.0.2.2:3000.

## React Native

- Download and open XCode from App Store.
- Install [homebrew](https://brew.sh/).
  - While React Native generally works with the newest built-in macOS ruby version it's better to upgrade. Upgrading with `sudo gem update --system` doesn't seem to work well.
- Then run `brew install rbenv ruby-build` to install rbenv a Ruby version manager to match the version required by React Native defined in [`.ruby-version`](https://github.com/facebook/react-native/blob/main/.ruby-version). Then switch to the proper version with `rbenv install 2.7.5` and `rbenv global 2.7.5`. Make sure the proper version is installed with `ruby --version`.
  - Add the following lines with `sudo vim ~/.zshrc` to the file and restart the Terminal.

```sh
# Add rbenv Ruby to path.
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# Add gems to path.
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
```

- Install Cocoapods gem with `gem install cocoapods --user-install` and update all gems with `gem update`. Also, run `gem update --system` to update gem itself.
- Download and install [AndroidStudio](https://developer.android.com/studio) Android IDE.
  - Use Android Studio to open the `/android` project folder from a React Native installation.
  - Update dependencies in the `SDK Manager` (icon in top-right).
  - Add a new Virtual Device in the `AVD Manager`.
  - Add below binaries (includes adb) to path with `vim ~/.zshrc`.

```sh
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Use Java bundled with Android Studio.
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/Contents/Home
# Required by flipper debugger.
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
```

### Update native Android installation

The default gradle version from the react-native installation will only work with very old Java versions.

- Update gradle to newest version in [Gradle Releases](https://gradle.org/releases/) and [Google Maven](https://maven.google.com/web/index.html?q=gradle#com.android.tools.build:gradle) for build.gradle
  - File android/build.gradle
  - and android/gradle/wrapper/gradle-wrapper.properties
