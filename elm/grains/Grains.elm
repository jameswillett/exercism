module Grains exposing (square, totalGrains)


square : Int -> Maybe Int
square n =
    if n < 1
    then Nothing
    else Just (2 ^ (n-1))

totalGrains : Int -> Maybe Int
totalGrains n =
    case n of
        1 -> Just 1
        _ -> Maybe.map2 (+) (square n) (totalGrains (n-1)) 
