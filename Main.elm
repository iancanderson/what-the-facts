module Main exposing (..)

import Html exposing (Html, button, div, p, text)
import Html.App as App
import Html.Events exposing (onClick)


main =
    App.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Answer =
    String


type alias Option =
    { body : String
    , correct : Bool
    }


type alias Question =
    { body : String
    , options : List Option
    }


type alias Model =
    { lastAnswer : Answer
    , questions : List Question
    , currentQuestion : Question
    }


firstQuestion : Question
firstQuestion =
    Question "Where is Aleppo?"
        [ Option "Iraq" False
        , Option "Syria" True
        , Option "Afghanistan" False
        ]


allQuestions : List Question
allQuestions =
    [ firstQuestion ]


model : Model
model =
    { lastAnswer = ""
    , questions = allQuestions
    , currentQuestion = firstQuestion
    }



-- UPDATE


type Msg
    = SubmitAnswer Answer


update : Msg -> Model -> Model
update msg model =
    case msg of
        SubmitAnswer answer ->
            { model | lastAnswer = answer }



-- VIEW


scoreView : Model -> Html Msg
scoreView model =
    p []
        [ text <| "Last answer: " ++ model.lastAnswer ]


optionView : Option -> Html Msg
optionView option =
    button [ onClick <| SubmitAnswer option.body ] [ text option.body ]


questionView : Model -> Html Msg
questionView model =
    div []
        [ p [] [ text model.currentQuestion.body ]
        , div [] <| List.map optionView model.currentQuestion.options
        ]


view : Model -> Html Msg
view model =
    div []
        [ scoreView model
        , questionView model
        ]
