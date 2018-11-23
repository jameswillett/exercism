module Beer (song) where

import Data.List (intercalate)
import Data.Char (toUpper)

capitalize :: String -> String
capitalize (h:t) = toUpper h : t
capitalize [] = ""

w :: String
w = " on the wall"

count :: Int -> String
count n = c ++ " bottle" ++ p ++ " of beer"
  where c = if n > 0 then show n else "no more"
        p = if n /= 1 then "s" else ""

action :: Int -> String
action n
  | n > 0 = "take " ++ p ++ " down and pass it around, "
  | otherwise = "go to the store and buy some more, "
  where p = if n == 1 then "it" else "one"

end :: Int -> String
end n
  | n > 0 = count (pred n) ++ w' ++ "\n"
  | otherwise = count 99 ++ w'
  where w' = w ++ ".\n"

verse :: Int -> String
verse n = intercalate "\n" $ map capitalize [ firstline, secondline ]
  where firstline = count n ++ w ++ ", " ++ count n ++ "."
        secondline = action n ++ end n

sing :: Int -> String
sing n
  | n > 0 = verse n ++ sing (pred n)
  | otherwise = verse n

song :: String
song = sing 99
