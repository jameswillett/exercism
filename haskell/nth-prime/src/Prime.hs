module Prime (nth) where

import Data.List

primes :: [Integer] -> Integer -> Int -> Integer
primes seed t n
  | n == length seed    = lastN
  | any isFactor seed   = primes seed next n
  | otherwise           = primes (seed ++ [t]) next n
  where lastN = last seed
        isFactor m = t `mod` m == 0
        next = t + 1

nth :: Int -> Maybe Integer
nth n
  | n <= 0    = Nothing
  | otherwise = Just $ primes seed start n
  where seed = [2::Integer]
        start = 3::Integer
