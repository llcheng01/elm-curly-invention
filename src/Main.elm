module Main exposing (..)

import Html exposing (text)

politely : String -> String
politely phrase = 
    "Excuse me, " ++ phrase

ask : String -> String -> String
ask thing place =
    "id there a " ++
        thing ++ " in the place " ++
        place ++ "?"
        
askPolitelyAboutFish: String -> String        
askPolitelyAboutFish = 
    politely << (ask "queen")
main = 
    text 
        <| politely
        <| ask "Queen" "palace"
    