# Purescript ReactNative Skeleton app for use in Expo

![screenshot for iOS Expo](screenshot_ios_resized.jpg)

# Pre-requisites

0. npm version < 5.
1. `npm install -g bower pulp create-react-native-app`
2. [entr](http://entrproject.org/).
3. yarn.

# Creating a skeleton Purescript ReactNative app

1. `create-react-native-app skeleton-app && cd skeleton-app`
2. Put the following into `bower.json` (create it):
```json
{
  "name": "skeleton-app",
  "ignore": [
    "**/.*",
    "node_modules",
    "bower_components",
    "output"
  ],
  "dependencies": {
    "purescript-prelude": "^3.1.0",
    "purescript-console": "^3.0.0",
    "purescript-dispatcher-react": "^2.0.0",
    "purescript-reactnative": "^4.0.1",
    "purescript-argonaut-codecs": "^3.0.0"
  },
  "devDependencies": {
    "purescript-psci-support": "^3.0.0"
  }
}
```
3. `bower install` .
4. Create `src/Main.purs` and add this to its contents:

```purescript
module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import React (ReactClass, spec, getProps, createClass, Render)
import ReactNative.API (REGISTER, registerComponent)
import ReactNative.Components.Text (text)
import ReactNative.Components.View (view)
import ReactNative.PropTypes.Color (orange)
import ReactNative.Styles (backgroundColor, flex, staticStyles, height)

render :: forall props state eff. Render props state eff
render ctx = do
  _ <- getProps ctx
  pure (view (staticStyles [flex 10, height 10])
        [ text (staticStyles [flex 10]) "\n\nHello World!!!!"
        , text (staticStyles [backgroundColor orange]) "Footnote!"
        ])

app :: forall p. ReactClass p
app = createClass $ spec {style: staticStyles [flex 1]} render
```

5. Substitute the contents of `App.js` for this:

```node
const Main = require('./index');
export default Main.app;
```

6. Create a `compile.sh` with the following contents:

```bash
#!/bin/bash

pulp build --to index.js --skip-entry-point \
     && (echo 'module.exports.app = PS.Main.app;' >> ./index.js)
```

7. `chmod +x compile.sh` .

8. `ls **/*.purs | entr ./compile.sh` .

9. `npm start` .
10. Scan the QR code with [Expo](https://expo.io/) in your phone.
11. Happy hacking your Hello World in Purescript for React Native!! 🍺
