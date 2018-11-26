module ArmstrongNumbers (armstrong) where

import Data.Char as C

armstrong :: Integral a => a -> Bool
armstrong original = (==) n $ sum $ map ((^l) . C.digitToInt) $ show n
  where n = fromIntegral original
        l = length $ show n
