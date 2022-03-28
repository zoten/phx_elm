module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { x : Int }


init : Model
init =
    { x = 0 }


type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | x = model.x + 1 }

        Decrement ->
            { model | x = model.x - 1 }
        
        Reset ->
            { model | x = 0 }


view : Model -> Html Msg
view model =
    div []
        [ button [class "h-10", class "px-6", class "font-semibold", class "rounded-md", class "bg-black", class "text-white", onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model.x) ]
        , button [ class "h-10", class "px-6", class "font-semibold", class "rounded-md", class "bg-black", class "text-white", onClick Increment ] [ text "+" ]
        , button [ class "h-10", class "px-6", class "font-semibold", class "rounded-md", class "bg-black", class "text-white", onClick Reset ] [ text "R" ]
        ]
