# Create directories that don't exist until opened
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Colorsublime\ -\ Themes/

# Install Package Control
curl "https://packagecontrol.io/Package%20Control.sublime-package" > settings/Package\ Control.sublime-package
cp -r settings/Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

# Install custom Sublime Settings
cp -r settings/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

# Install custom theme
cp -r settings/Colorsublime\ -\ Themes/1337.tmTheme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Colorsublime\ -\ Themes/1337.tmTheme
