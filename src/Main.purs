module Main where

import Prelude

import Effect (Effect)
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.VDom.Driver (runUI)

import Pages.Login (componentBody)

main :: Effect Unit
main = runHalogenAff do
  body <- awaitBody
  runUI componentBody unit body

