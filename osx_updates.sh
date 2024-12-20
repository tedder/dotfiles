#!/bin/bash -exv

# sources:
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# needed for brew
xcode-select --install || true


# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable Notification Center and remove the menu bar icon
#launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# don't turn -- into the fancy emdash.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# kill inertia scrolling on the mouse scroll wheel
# https://apple.stackexchange.com/questions/159180/yosemite-disabling-inertia-scrolling-using-scroll-wheel-for-the-mouse
defaults write .GlobalPreferences com.apple.scrollwheel.scaling -1


# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Set the timezone; see `systemsetup -listtimezones` for other values
systemsetup -settimezone "America/Los_Angeles" > /dev/null

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Save screenshots to Dropbox
defaults write com.apple.screencapture location -string "${HOME}/Dropbox/Camera Uploads/"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Finder: show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network, USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
#defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# import themes
open Solarized\ Light\ xterm-256color.terminal
open Solarized\ Dark\ xterm-256color.terminal

# set light as default
defaults write com.apple.terminal "Default Window Settings" -string "Solarized Light xterm-256color"
defaults write com.apple.terminal "Startup Window Settings" -string "Solarized Light xterm-256color"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

## Google Chrome
# Allow installing user scripts via GitHub or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"

## from: https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library



## dock settings from:
## http://secrets.blacktree.com/?showapp=com.apple.dock

# dock max size
defaults write com.apple.dock tilesize -int 60

# transparent dock
defaults write com.apple.dock hide-mirror -bool true

# dock to left
if [ "$HOST" != "Teds-MacBook-Air.local" ]; then
  defaults write com.apple.dock orientation -string left
fi

# autohide
defaults write com.apple.dock autohide -boolean True


# go away, facetime.
rm -f /Users/ted/Library/Preferences/com.apple.facetime.bag.plist /Users/ted/Library/Preferences/com.apple.imservice.ids.FaceTime.plist

# set date/time/clock to show date and day and 24hr
defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE MMM d   H:mm'

# show percentage in menu
defaults write com.apple.menuextra.battery ShowPercent -string "YES"


# stfu Apple Photos autolaunch
# http://petapixel.com/2015/12/21/stop-apple-photos-from-auto-launching-in-os-x-with-one-command/
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# cool off, ksfetch. Google process that connects endlessly and is a random service,
# so Little Snitch is confused every damn time.
defaults write com.google.Keystone.Agent checkInterval 604800


brew install dockutil
dockutil --list | egrep -i "persistentapp|persistent-apps" | cut -f 1 | egrep -v "Siri" | xargs -L 1  -I __ dockutil --remove "__"
dockutil --add /Applications/Google\ Chrome.app
dockutil --add /Applications/1Password*.app
if [ -e /Applications/Adobe\ Lightroom/Adobe\ Lightroom.app ]; then
  dockutil --add /Applications/Adobe\ Lightroom/Adobe\ Lightroom.app
fi

dockutil --add /Applications/Slack.app
dockutil --add /Applications/iMovie.app
dockutil --add /Applications/Utilities/Terminal.app
dockutil --add /Applications/Slack.app

# docker
#wget -nd -c -P ~/Downloads/  https://download.docker.com/mac/beta/Docker.dmg && open ~/Downloads/Docker.dmg
#



###############################################################################
# Kill affected applications                                                  #
# not killing terminal because we're using it.                                #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "SystemUIServer" \
	"Transmission" "Twitter" "iCal"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."


