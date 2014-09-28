chrome.app.runtime.onLaunched.addListener ( launchData ) ->
  chrome.app.window.create 'bin/vulcanized.html',
    id: 'mainWindow'
    bounds:
      width: 800
      height: 600
