module Pidg exposing (..)

import Html exposing (Html, p)
import Html.Attributes exposing (attribute)


trans : Html msg
trans =
    p [ attribute "data-defo-pidg" "msg.header" ] []
