module Isogram (isIsogram) where

import Data.Char (toLower, isLetter)
import Data.List (sort, group)

isIsogram :: String -> Bool
isIsogram = not . any ((>1) . length) . group . sort . map toLower . filter isLetter
