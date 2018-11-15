module Gigasecond exposing (add)

import Date

add : Date.Date -> Date.Date 
add timestamp =
    Date.toTime timestamp
        |> (+) (10^12)
        |> Date.fromTime

