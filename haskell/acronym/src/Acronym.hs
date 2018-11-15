module Acronym (abbreviate) where
import Data.Char

abbreviate :: String -> String
abbreviate = map (toUpper . head) . words
