module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int deriving (Eq)

minutesInDay :: Int
minutesInDay = 60 * 24

validDayMinutes :: Int -> Bool
validDayMinutes mins = 0 <= mins && mins < minutesInDay

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
toString clock = hourLead ++ hour ++ ":" ++ minuteLead ++ minute
  where Clock v     = clock
        h           = v `quot` 60
        m           = v `mod` 60
        hour        = show h
        minute      = show m
        lead x      = if x < 10 then "0" else ""
        hourLead    = lead h
        minuteLead  = lead m

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = Clock $ dayMinutes hour (min + v)
  where Clock v = clock
