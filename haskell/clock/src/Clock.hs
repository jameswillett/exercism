module Clock (addDelta, fromHourMin, toString) where

import Text.Printf (printf)

data Clock = Clock Int deriving (Eq)

minutesInDay :: Int
minutesInDay = 60 * 24

runMinutes :: Int -> Int
runMinutes mins 
  | mins < 0              = runMinutes (mins + minutesInDay)
  | mins >= minutesInDay  = runMinutes (mins - minutesInDay)
  | otherwise             = mins

dayMinutes :: Int -> Int -> Int
dayMinutes hour min = runMinutes $ hour * 60 + min

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock $ dayMinutes hour min

toString :: Clock -> String
toString clock = printf "%02d:%02d" hour minute
  where Clock v = clock
        hour    = v `quot` 60
        minute  = v `mod` 60

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = Clock $ dayMinutes hour (min + v)
  where Clock v = clock
