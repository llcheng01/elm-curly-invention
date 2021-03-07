module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Debug exposing (toString)

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

type alias Dog = 
    { name : String
    , age : Int
    }

dogS = 
    {
        name = "Spock"
        , age = 3
    }

renderDog : Dog -> String
renderDog dog = 
    dog.name ++ ", " ++ (toString dog.age) 

dogs = 
    [ { name = "Legolas", age = 2931 }
    , { name = "Gimli", age = 193 }
    ]

listDogs: List Dog -> List String
listDogs peeps = List.map (\peep -> peep.name) peeps

findDog : String -> List Dog -> Maybe Dog
findDog name doggs = List.foldl
    (\peep memo -> 
        case memo of 
            Just _ -> memo
            Nothing -> if peep.name == name then
                Just peep
                else Nothing
    )
    Nothing
    doggs

shipsS = 
    [ { name = "X-wing", cost = 14999 }
    , { name = "Millennium Falcon", cost = 100000 }
    , { name = "Death Star", cost = 111111111111  }
    ]


renderShip ship = 
    li []
        [text ship.name
        , text ", "
        , b []
            [text <| toString ship.cost]
        ]

renderShips ships =
    div 
        [ style "font-family" "-apple-system"
        , style "padding" "1em"
        ] 
        [ h1 [] [text "Ships"]
        , ul [] (List.map renderShip ships)
        ]

numbers =
    [1, 2, 3, 4, 5]

fruits =
    [ { name = "Orange"}, { name = "Banana"} ]

printThing : thing -> Html msg
printThing thing =
    ul [] [ text <| toString thing ]


-- Four things:
model = 
    { showFace = False }

type Msg = 
    ShowFace | HideFace

flip: Bool -> Bool
flip bool = 
    if bool == True then
        False
    else
        True

update msg model_ =
    case msg of 
        ShowFace -> 
            map (\m -> if m.showFace == True then m.showFace = False else m.showFace = True ) model_
        --     { model_ | showFace = True }
        -- HideFace -> { model_ | showFace = False }
        

view model_ = 
    div []
        [ h1 [] [ text "Face Generator"] 
        , button [ onClick ShowFace ] [ text "Face me" ]
        , if model_.showFace then
            text "L(^ 0 ^)L"
          else
            text ""
        ]

main = 
    -- text 
        -- <| askPolitelyAboutFish 
        -- <| ask "Queen" "palace"
        -- <| renderDog dogS
        -- <| toString
        -- <| findDog "Susan" dogs
        -- renderShips shipsS
        -- ul [] (List.map printThing fruits)
        Browser.sandbox
            {
                init = model
                , view = view
                , update = update
            }