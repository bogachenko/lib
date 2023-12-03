
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