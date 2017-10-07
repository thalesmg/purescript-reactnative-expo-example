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

main :: forall e. Eff (register :: REGISTER | e) Unit
main = registerComponent "OlaMundo" app

main2 :: forall e. Eff (console :: CONSOLE | e) Unit
main2 = do
  log "Hello sailor!"
