module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)

import List exposing (foldl, map, range)

squareOfSum : Int -> Int
squareOfSum n =
    range 1 n
        |> foldl (+) 0
        |> flip (^) 2


sumOfSquares : Int -> Int
sumOfSquares n =
    range 1 n
        |> map (flip (^) 2)
        |> foldl (+) 0


difference : Int -> Int
difference n =
    let
        sqOfSum = squareOfSum n
        sumOfSq = sumOfSquares n
    in
        sqOfSum - sumOfSq
