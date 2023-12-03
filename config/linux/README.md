
###### To begin with, I use Archlinux. Some settings installed here will be individual for a different distribution, I also want to warn you that using these settings is at your own risk.

##### .Xresources
To use the file `.Xresources`, need to import it into your profile folder (in some distributions it is created by default).<br>

READ ME - https://en.wikipedia.org/wiki/X_resources
| Linux                     | Path                   |
| ------------------------- | -----------------------|
| Your profile              | `~/.Xresources`        |
| Root                      | `/root/.Xresources`    |


_Load a resource file (such as the conventional `.Xresources`), replacing any current settings:<br>_
_`xrdb ~/.Xresources`<br>_
_Load a resource file, and merge with the current settings:<br>_
_`xrdb -merge ~/.Xresources`_

##### i3config
To use `i3config`, need to move it (after renaming it from `i3config` to `config``) to your settings directory located in your profile folder.<br>

READ ME - https://i3wm.org/docs/userguide.html; https://wiki.archlinux.org/title/i3
| Linux                     | Path                   |
| ------------------------- | -----------------------|
| Your profile              | `~/.config/i3/config`        |
| Root                      | `/root/.config/i3/config`    |