## TEXT folder

##### assets.json

To use group policy in the Firefox browser, need to create the `distribution` folder in the root of the program, and create the `policies.json` file in it.<br>
READ ME - https://support.mozilla.org/en-US/kb/customizing-firefox-using-policiesjson

```json
{
  "policies": {
    "3rdparty": {
      "Extensions": {
        "uBlock0@raymondhill.net": {
          "adminSettings": {
            "assetsBootstrapLocation": "https://raw.githubusercontent.com/bogachenko/lib/master/text/assets.json"
          }
        }
      }
    }
  }
}
```

##### firefox-user.js

To use Firefox custom settings, need to import it into your profile folder, and then rename the `firefox-user.js` file to `user.js`.

| OS                         | Path                                                                               |
| -------------------------- | ---------------------------------------------------------------------------------- |
| Windows                    | `%APPDATA%\Mozilla\Firefox\Profiles\XXXXXXXX.your_profile_name\user.js`            |
| Linux                      | `~/.mozilla/firefox/XXXXXXXX.your_profile_name/user.js`                            |
| OS X                       | `~/Library/Application Support/Firefox/Profiles/XXXXXXXX.your_profile_name`        |

##### fennec-user.js

To use Fennec custom settings, need to import it into your profile folder, and then rename the `fennec-user.js` file to `user.js`.

| OS                         | Path                                                                               |
| -------------------------- | ---------------------------------------------------------------------------------- |
| Android                    | `/data/data/org.mozilla.firefox/files/mozilla/XXXXXXXX.your_profile_name`          |

##### thunderbird-user.js

To use Thunderbird custom settings, need to import it into your profile folder, and then rename the `thunderbird-user.js` file to `user.js`.

| OS                         | Path                                                                               |
| -------------------------- | ---------------------------------------------------------------------------------- |
| Windows                    | `%APPDATA%\Mozilla\Thunderbird\Profiles\XXXXXXXX.your_profile_name\user.js`        |
| Linux                      | `~/.mozilla/Thunderbird/XXXXXXXX.your_profile_name/user.js`                        |
| OS X                       | `~/Library/Application Support/Thunderbird/Profiles/XXXXXXXX.your_profile_name`    |