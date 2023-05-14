module Pidg exposing (I18n, activate, init, trans)

import Html exposing (Html, span)
import Html.Attributes exposing (attribute)
import Json.Encode as JE


type I18n
    = I18n I18nConfiguration


type alias I18nConfiguration =
    { locale : String
    }


init : I18n
init =
    I18n { locale = "en" }


activate : String -> I18n -> I18n
activate l (I18n config) =
    I18n { config | locale = l }



-- MODIFIERS


encode : I18n -> String -> String
encode (I18n config) content =
    JE.encode 0
        (JE.object
            [ ( "locale", JE.string config.locale )
            , ( "id", JE.string content )
            ]
        )


trans : String -> I18n -> Html msg
trans message i18n =
    span [ attribute "data-defo-pidg" (encode i18n message) ] []
