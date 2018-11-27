module Allergies (Allergen(..), allergies, isAllergicTo) where

import Data.Bits

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Eq, Show)

allergensWithScores :: [(Allergen, Int)]
allergensWithScores = zip [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats] $ map (2^) [0..]

allergies :: Int -> [Allergen]
allergies score = map (\(allergen, _) -> allergen) $ filter (\(_, val) -> (/=0)$ (.&.) val score) allergensWithScores

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen score = elem allergen $ allergies score
