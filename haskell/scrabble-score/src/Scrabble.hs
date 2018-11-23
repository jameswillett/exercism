module Scrabble (scoreLetter, scoreWord) where

import Data.Char as C

onePoints   = "aeioulrnst"
twoPoints   = "dg"
threePoints = "bcmp"
fourPoints  = "fhvwy"
fivePoints  = "k"
eightPoints = "jx"
tenPoints   = "qz"

scoreLetter :: Char -> Integer
scoreLetter letter
  | l `elem` onePoints = 1
  | l `elem` twoPoints = 2
  | l `elem` threePoints = 3
  | l `elem` fourPoints  = 4
  | l `elem` fivePoints = 5
  | l `elem` eightPoints = 8
  | l `elem` tenPoints = 10
  | otherwise = 0
  where l = C.toLower letter

scoreWord :: String -> Integer
scoreWord =
  sum . map scoreLetter
