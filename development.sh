#!/bin/sh
LOGO="\033[1;34minstl\033[0m"
printf "${LOGO} Configuring macOS Monterey and installing software for Web Development.\n"

printf "\n${LOGO} \033[1mConfiguring the System\033[0m\n\n"

printf "🛠️  Setting increasing mouse tracking speed.\n"
defaults write -g com.apple.mouse.scaling 2.5
printf "🛠️  Enable Magic Mouse right click.\n"
defaults write com.apple.AppleMultitouchMouse.plist MouseButtonMode TwoButton
printf "🛠️  Won't show recent applications in dock anymore.\n"
defaults write com.apple.dock show-recents -bool FALSE
printf "👷 Remove the applications you don't need from the dock yourself.\n"
printf "🛠️  Configuring Hot Corners.\n"
# Bottom-left: Desktop, Bottom-right: Mission Control
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-br-corner -int 2
# Requires no additional keys to be pressed, default is to require ⌘.
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-modifier -int 0
printf "🛠️  Turning display off later 1 hour for 🔋 and 3 hours for 🔌 (requires sudo).\n"
# Turn display off after 3h or 1h for battery, requires sudo.
sudo pmset -a displaysleep 180
sudo pmset -b displaysleep 60
printf "🛠️  Enabling automatic software updates (requires sudo).\n"
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -int 1
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -int 1
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -int 1
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -int 1
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -int 1
sudo defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -int 1
printf "🛠️  Listing available Mac updates.\n"
softwareupdate -l
read -p "Do you want install the updates if there are any? (Type y for yes or n for no) " yn
case $yn in
    [Yy]* ) softwareupdate -i -a; break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes (type: y) or no (type: n).";;
esac

printf "🔄  Reloading dock for changes to take effect.\n"
killall Dock

printf "\n${LOGO} \033[1mApplications\033[0m\n\n"

printf "Prompting to install XCode CLI Tools like git, might take some time.\n"
xcode-select --install
printf "Installing Google Chrome.\n"
curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o ~/Downloads/googlechrome.dmg
open ~/Downloads/googlechrome.dmg
sleep .5 # wait until volume is mounted.
sudo cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
diskutil eject Google\ Chrome
rm ~/Downloads/googlechrome.dmg
printf "Opening Google Chrome to download further software.\n"
open -a /Applications/Google\ Chrome.app --args 'https://nodejs.org' 'https://code.visualstudio.com' 'https://www.sourcetreeapp.com'
printf "To download latest node, click \033[1mCurrent\033[0m.\n"
printf "To download VS Code, click \033[1mDownload Mac Universal\033[0m.\n"
printf "To download Sourcetree, click \033[1mDownload for Mac OS X\033[0m.\n"

printf "\n${LOGO} \033[1mTerminal\033[0m\n\n"
echo "export PS1='→ '" >> ~/.zshrc
echo "export PATH=\"\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin\"" >> ~/.zshrc
printf "Reloading Terminal configuration from ~/.zshrc.\n"
source ~/.zshrc

printf "\n${LOGO} Done 😃 You're all set and ready to code away.\n"
