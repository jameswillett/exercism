module Luhn (isValid) where
import Data.Char

doMath :: Char -> Int
doMath a = r - (if r > 9 then 9 else 0)
  where r = (*) 2 $ digitToInt a

doubleSecond :: (Int, Char) -> Int
doubleSecond (i, v)
  | i `mod` 2 == 0  = doMath v
  | otherwise       = digitToInt v

divByTen :: Int -> Bool
divByTen n = n `mod` 10 == 0

addIndex :: [Char] -> [(Int, Char)]
addIndex x = zip y x 
  where y = reverse [0..(length x)]

magicFunction :: [Char] -> Bool
magicFunction = divByTen . sum . map doubleSecond . addIndex

isValid :: [Char] -> Bool
isValid n
  | length m > 1  = magicFunction m
  | otherwise     = False
  where m = filter isDigit n
