module Main where

import Prelude

import Effect (Effect)
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.VDom.Driver (runUI)

import Pages.Login (component)

main :: Effect Unit
main = runHalogenAff do
  body <- awaitBody
  runUI component unit body

