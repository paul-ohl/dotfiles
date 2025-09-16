# Firefox stuff

## Vimium

Files: `vimium.json`

All you have to do is click 'import' in the vimium settings and select the `vimium.json` file. That's it.

## Sidebery

Files: `sidebery-data.json`, `userChrome.css`

Import the sidebery-data.json file in Sidebery's options, then:

### Activating Userchrome.css:

In Firefox:
1. Go to "about:config"
2. Enter toolkit.legacyUserProfileCustomizations.stylesheets and set it to `true`
3. Go to "about:support"
4. Use that page to access "Profile directory"
5. In your file explorer: create a directory `chrome/`
6. copy the `userChrome.css` file to that folder
7. (Maybe not needed) To remove the new sidebar update (in 133.0), go into about:config in the address bar, search for sidebar.revamp, and set it to false
