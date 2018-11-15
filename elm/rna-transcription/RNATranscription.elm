module RNATranscription exposing (toRNA)

translate : Char -> Result String Char
translate nucleotide =
    case nucleotide of
        'G' -> Ok 'C'
        'C' -> Ok 'G'
        'T' -> Ok 'A'
        'A' -> Ok 'U'
        _ -> Err ((String.fromChar nucleotide) ++ " is not a valid nucleotide")

toRNA : String -> Result String String
toRNA dna =
    case (String.uncons dna) of
        Just (h, t) ->
            Result.map2 String.cons (translate h) (toRNA t)
        Nothing -> 
            Ok ""
