from themer import ThemeActivator
import os

class WallpaperActivator(ThemeActivator):
    def activate(self):
        os.system('osascript -e \'tell application "Finder" to set desktop picture to POSIX file "/Users/philip/Repos/dotfiles/themer/current/bg.png"\'')
