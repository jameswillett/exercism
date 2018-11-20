module CollatzConjecture (collatz) where

collatz' :: Integer -> Integer -> Integer
collatz' n i
  | n == 1 = i
  | n `mod` 2 == 0 = collatz' (n`quot` 2) (succ i)
  | otherwise = collatz' (3 * n + 1) (succ i)

collatz :: Integer -> Maybe Integer
collatz n
  | n < 1 = Nothing
  | otherwise = Just $ collatz' n 0
