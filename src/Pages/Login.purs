module Pages.Login where

import Prelude

import DOM.HTML.Indexed.InputType (InputType(InputText, InputPassword))
import Effect.Aff (Aff)
import Halogen (Component)
import Halogen as H
import Halogen.HTML (ClassName(..), IProp, a, div, form, h2, i, img, input, text)
import Halogen.HTML.Properties (class_, href, name, placeholder, src, type_)

component :: forall query input output. Component query input output Aff
component =
  H.mkComponent
    { initialState: identity
    , render
    , eval: H.mkEval H.defaultEval
    }
  where
  render _ =
    div
      [ classN "ui middle aligned center aligned grid" ]
      [ div
          [ classN "column" ]
          [ h2
              [ classN "ui teal image header" ]
              [ img [ classN "image", src "assets/images/logo.png" ]
              , div [ classN "content" ] [ text "Log-in to your account" ]
              ]
          , form
              [ classN "ui large form initial" ]
              [ div
                  [ classN "ui stacked segment" ]
                  [ div
                      [ classN "field" ]
                      [ div
                          [ classN "ui left icon input" ]
                          [ i
                              [ classN "user icon" ]
                              []
                          , input
                              [ type_ InputText
                              , name "email"
                              , placeholder "E-mail address"
                              ]
                          ]
                      ]
                  , div
                      [ classN "field" ]
                      [ div
                          [ classN "ui left icon input" ]
                          [ i
                              [ classN "lock icon" ]
                              []
                          , input
                              [ type_ InputPassword
                              , name "password"
                              , placeholder "Password"
                              ]
                          ]
                      ]
                  , div
                      [ classN "ui fluid large teal submit button" ]
                      [ text "login" ]
                  ]
              ]
          , div
              [ classN "ui message" ]
              [ text "New to us?"
              , a
                  [ href "#" ]
                  [ text "Sign Up" ]
              ]
          ]
      ]
    where
    classN :: forall r i. String -> IProp (class :: String | r) i
    classN = class_ <<< ClassName
