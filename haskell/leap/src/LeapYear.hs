module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
  | yearDivisibleBy 100 = yearDivisibleBy 400 
  | otherwise           = yearDivisibleBy 4
  
  where yearDivisibleBy x = year `mod` x == 0
