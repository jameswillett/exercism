module Raindrops (convert) where

import Data.List as L

convert :: Int -> String
convert n = if null sound then show n else sound
  where makePattern (w, x)  = cycle $ (++[w]) $ take (pred x) $ repeat ""
        patterns            = map makePattern [("Pling", 3), ("Plang", 5), ("Plong", 7)]
        zipped              = foldl (zipWith (++)) (repeat "") patterns
        sound               = zipped!!(pred n)
