module TwoFer exposing (twoFer)
import String exposing (concat)

twoFer : Maybe String -> String
twoFer name =
    let
        n =
          case name of
            Nothing -> "you"
            Just name -> name
    in
        concat ["One for ", n, ", one for me."]
