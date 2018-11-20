module Pangram (isPangram) where

import Data.Char as C

isPangram :: String -> Bool
isPangram = isPangram . onlyletters . lowercases
  where lowercases  = map C.toLower
        onlyletters = filter C.isLetter
        isPangram x = all (`elem` x) ['a'..'z']
