module Raindrops (convert) where

import Data.List as L
import Data.List.Index as I

convert :: Int -> String
convert n = plingPlangPlong!!(pred n)
  where makePattern (w, x)  = cycle $ (++[w]) $ take (pred x) $ repeat ""
        patterns            = map makePattern [("Pling", 3), ("Plang", 5), ("Plong", 7)]
        zipped              =  foldl (zipWith (++)) (repeat "") patterns
        plingPlangPlong     = I.imap (\i x -> if x == "" then show (succ i) else x) zipped      
