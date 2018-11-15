module Anagram (anagramsFor) where
import Data.List (sort)
import Data.Char (toLower)

all' :: a -> [ a -> Bool ] -> Bool
all' _ [] = True
all' v (f:xs)
    | f v       = all' v xs
    | otherwise = False


anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter (\x -> all' x [ isAnagram, isNotSelf ])
  where 
    lowerCase = map toLower
    word' = lowerCase word
    word'' = sort word'
    isAnagram x = (sort $ lowerCase x) == word''
    isNotSelf x = (lowerCase x) /= word'

