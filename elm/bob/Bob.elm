module Bob exposing (hey, isShouting)

import String as S
import Char as C
import List as L

type Emotion
    = Indignant
    | Imasculated
    | Defensive
    | Unsure
    | Indifferent

satisfiesAll : List (a -> Bool) -> a -> Bool
satisfiesAll fns v =
    L.map (\f -> f v) fns
    |> L.all ((==) True)

satisfiesAny : List (a -> Bool) -> a -> Bool
satisfiesAny fns v =
    L.map (\f -> f v) fns
    |> L.any ((==) True)

justLetters : String -> String
justLetters = 
    satisfiesAny [C.isLower, C.isUpper, C.isDigit]
    |> S.filter

isSilence : String -> Bool
isSilence = justLetters >> S.length >> (==) 0

isShouting : String -> Bool
isShouting = justLetters
    >> S.filter (not << C.isDigit) 
    >> satisfiesAll [S.all C.isUpper, S.length >> (/=) 0]

isQuestion : String -> Bool
isQuestion = S.endsWith "?"

associateEmotion : String -> Emotion
associateEmotion remark = 
    if isSilence remark then Indignant
    else if isShouting remark then  
        if isQuestion remark then Imasculated
        else Defensive
    else if isQuestion remark then Unsure
    else Indifferent

hey : String -> String
hey remark =
    case associateEmotion remark of
        Indignant -> "Fine. Be that way!"
        Imasculated -> "Calm down, I know what I'm doing!"
        Defensive -> "Whoa, chill out!"
        Unsure -> "Sure."
        Indifferent -> "Whatever."
