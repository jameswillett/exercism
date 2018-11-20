module SumOfMultiples (sumOfMultiples) where

factorOf :: Integer -> Integer -> Bool
factorOf x y 
  | y == 0 = False
  | otherwise = x `mod` y == 0

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter onlyFactors [1..(pred limit)]
  where onlyFactors x = any (factorOf x) factors
