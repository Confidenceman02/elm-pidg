module Pidg exposing (..)

import Html exposing (Html, p)
import Html.Attributes exposing (property)
import Json.Encode as JE


trans : Html msg
trans =
    p [ property "data-defo-pidg" (JE.string "messages") ] []
