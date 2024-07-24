module Pages.Login where

import Prelude

import DOM.HTML.Indexed.InputType (InputType(InputText, InputPassword))
import Effect.Aff (Aff)
import Halogen (Component, HalogenM, liftEffect)
import Halogen as H
import Halogen.HTML (ClassName(..), IProp, a, div, form, h2, i, img, input, text)
import Halogen.HTML.Events (onClick)
import Halogen.HTML.Properties (class_, href, name, placeholder, src, type_)
import Pages.Login.Validation (validateForm)
import Web.HTML (window)
import Web.HTML.Window (document)

data Action =
  Validate

componentBody :: forall query input output. Component query input output Aff
componentBody =
  H.mkComponent
    { initialState: identity
    , render
    , eval: H.mkEval H.defaultEval { handleAction = handleAction }
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
                      [ classN "ui fluid large teal submit button"
                      , onClick \_ -> Validate
                      ]
                      [ text "login" ]
                  ]
              ]
          , div
              [ classN "ui message" ]
              [ text "New to us? "
              , a
                  [ href "#" ]
                  [ text "Sign Up" ]
              ]
          ]
      ]
    where
    classN :: forall r i. String -> IProp (class :: String | r) i
    classN = class_ <<< ClassName

  handleAction :: forall state. Action -> HalogenM state Action () output Aff Unit
  handleAction = case _ of
    Validate -> do
      doc <- liftEffect (document =<< window)
      liftEffect $ validateForm doc classs fields
    where
    classs = "ui.form"
    fields =
      { fields:
          { email:
              { identifier: "email"
              , rules:
                  [ { type: "empty", prompt: "Please, enter your e-mail" }
                  , { type: "email", prompt: "Please, enter a valid e-mail" }
                  ]
              }
          , password:
              { identifier: "password"
              , rules:
                  [ { type: "empty", prompt: "Please, enter your password" }
                  , { type: "length[6]", prompt: "Your password must be at least 6 characters" }
                  ]
              }
          }
      }
