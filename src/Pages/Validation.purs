module Pages.Login.Validation (validateForm) where

import Data.Unit (Unit)
import Effect (Effect)
import Web.HTML (HTMLDocument)

type RuleType =
  { type :: String
  , prompt :: String
  }

type Identifier =
  { identifier :: String
  , rules :: Array RuleType
  }

type FormValidationFields =
  { fields ::
      { email :: Identifier
      , password :: Identifier
      }
  }

foreign import validateFormImpl :: HTMLDocument -> String -> FormValidationFields -> Effect Unit

--| function that takes a class and a an object containing rules
--| for parsing input and performs validation, possibly modifying
--| screen
validateForm :: HTMLDocument -> String -> FormValidationFields -> Effect Unit
validateForm = validateFormImpl

