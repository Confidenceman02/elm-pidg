module Main exposing (Msg(..), main, update, view)

import Browser exposing (Document)
import Html exposing (button, div, text)
import Html.Events exposing (onClick)


main : Program () Int Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


init : () -> ( Int, Cmd msg )
init _ =
    ( 0, Cmd.none )


type Msg
    = Increment
    | Decrement


update : Msg -> Int -> ( Int, Cmd msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )


view : Int -> Document Msg
view model =
    { title = "Pidge example"
    , body =
        [ div []
            [ button [ onClick Decrement ] [ text "-" ]
            , div [] [ text (String.fromInt model) ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        ]
    }

