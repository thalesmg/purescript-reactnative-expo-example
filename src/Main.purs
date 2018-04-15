module Main where

import Images (avatar)

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import React (ReactClass, spec, getProps, createClass, Render, ReactElement)
import ReactNative.API (REGISTER, registerComponent)
import ReactNative.Components.Text (text)
import ReactNative.Components.Image (image)
import ReactNative.Components.View (view)
import ReactNative.PropTypes.Color (orange)
import ReactNative.PropTypes (uriSrc)
import ReactNative.Styles (backgroundColor, flex, staticStyles, height, width, marginLeft, marginRight)
import ReactNative.Styles.Flex (flexDirection, row, column, FlexAlignment(..), alignItems, alignSelf)

render :: forall props state eff. Render props state ReactElement eff
render ctx = do
  _ <- getProps ctx
  pure (view (staticStyles [flex 10])
        [ text (staticStyles [flex 2]) "\n\nHello World!!!!"
        , view (staticStyles [flex 3, flexDirection column])
          [ image (staticStyles [flex 3, flexDirection column, alignSelf (FlexAlignment "center")])
            avatar
          ]
        , text (staticStyles [flex 1]) "Olá!"
        , text (staticStyles [backgroundColor orange]) "Footnote!"
        ])

app :: forall p. ReactClass p
app = createClass $ spec {style: staticStyles [flex 1]} render
