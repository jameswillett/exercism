module Isogram (isIsogram) where

import Data.Char (toLower, isLetter)
import Data.List (sort, group, nub)

normalize :: String -> String
normalize = map toLower . filter isLetter

isIsogram :: String -> Bool
isIsogram = all ((==1) . length) . group . sort . normalize

isIsogram' :: String -> Bool
isIsogram' w = lw == lw'
  where n   = normalize w
        lw  = length n
        lw' = length $ nub n
