import Html exposing (Html, button, div, p, text)
import Html.App as App
import Html.Events exposing (onClick)


main =
  App.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Answer = String
type alias Model = Answer

model : Model
model =
  ""

-- UPDATE

type Msg = SubmitAnswer Answer

update : Msg -> Model -> Model
update msg model =
  case msg of
    SubmitAnswer answer ->
      answer

-- VIEW

scoreView : Model -> Html Msg
scoreView model =
  p [] [ text <| "Last answer: " ++ model ]

view : Model -> Html Msg
view model =
  div []
    [
      scoreView model,
      p []
        [ text "Where is Aleppo?" ],
      div []
        [ button [ onClick <| SubmitAnswer "Iraq" ] [ text "Iraq" ]
        , button [ onClick <| SubmitAnswer "Syria" ] [ text "Syria" ]
        , button [ onClick <| SubmitAnswer "Afghanistan" ] [ text "Afghanistan" ]
        ]
    ]
