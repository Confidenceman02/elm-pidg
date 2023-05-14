module Main exposing (main, update, view)

import Browser exposing (Document)
import Html exposing (button, p, text)
import Html.Events exposing (onClick)
import Pidg


type Msg
    = SetEn
    | SetFr


type alias Model =
    { i18n : Pidg.I18n
    }


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


init : () -> ( Model, Cmd msg )
init _ =
    ( { i18n = Pidg.init }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        SetEn ->
            ( { model | i18n = Pidg.activate "en" model.i18n }, Cmd.none )

        SetFr ->
            ( { model | i18n = Pidg.activate "fr" model.i18n }, Cmd.none )


view : Model -> Document Msg
view model =
    { title = "Pidg example"
    , body =
        [ Pidg.trans "Hello world" model.i18n
        , p []
            [ text "Hi there, i'm not translatable!"
            ]
        , button [ onClick SetFr ] [ text "French" ]
        , button [ onClick SetEn ] [ text "English" ]
        ]
    }
