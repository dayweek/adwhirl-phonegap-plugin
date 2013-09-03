# AdWhirl PhoneGap/Cordova Plugin

The plugin allows you to display a banner from [AdWhirl](https://www.adwhirl.com/) ad network in your Cordova app.

## Installation

Copy `AdWhirl.h` and `AdWhirl.m` into Cordova-iOS application folder and add this to `Cordova.plist` _Plugins_ key:

```xml
<key>Echo</key>
<string>Echo</string>
```

Add dependency into `app.json`:

```javascript
"path": "AdWhirl.js"
```

Note that you need to install AdWhirl SDK as well.

## Usage

The plugin basically resizes _UIWebView_ (in which the Cordova app is running) and inserts _AdWhirl_ banner view.

```javascript
AdWhirl.show // shows banner
AdWhirl.hide // hides banner
```

## Copyright

Copyright (c) 2013 David Hrachovy
