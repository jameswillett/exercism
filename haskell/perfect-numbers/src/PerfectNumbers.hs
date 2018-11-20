module PerfectNumbers (classify, aliquot', Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aliquot' n i
  | i * 2 > n       = 0
  | n `mod` i == 0  = i + aliquot' n (i + 1)
  | otherwise       = aliquot' n (i + 1)

classify :: Int -> Maybe Classification
classify n
  | n <= 0        = Nothing
  | aliquot == n  = Just Perfect
  | aliquot > n   = Just Abundant
  | aliquot < n   = Just Deficient
  where aliquot = aliquot' n 1 
        --List comprehension is mad slow on the large numbers
        --aliquot = sum [ i | i <- [1..n-1], n `mod` i == 0 ]
