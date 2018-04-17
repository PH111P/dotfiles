from themer import ThemeActivator
import os

class WallpaperActivator(ThemeActivator):
    def activate(self):
        os.system('ln -f /home/philip/Repos/dotfiles/themer/current/bg.png /usr/share/backgrounds/bg.png')
        os.system('feh --bg-scale /usr/share/backgrounds/bg.png')
