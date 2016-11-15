module UpdateUI exposing (frame, message)

import Model
import UpdateGame
import Msg
import Init


frame : Float -> Model.Model -> Model.Model
frame deltaSeconds model =
    if model.transitionInactivity > 0 then
        { model | transitionInactivity = max 0 (model.transitionInactivity - deltaSeconds) }
    else
        model


message : Msg.UIMessage -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
message msg model =
    if model.transitionInactivity > 0 then
        model ! []
    else
        (case msg of
            Msg.ResumeGame ->
                let
                    ( newModel, startMessages ) =
                        UpdateGame.startGame model
                in
                    (Model.setState newModel Model.Running) ! startMessages

            Msg.RestartGame ->
                Init.init
            
            Msg.SetScale scale ->
                { model | scale = scale} ! []
        )
