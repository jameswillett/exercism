module CryptoSquare (encode) where
import Data.Char
import Data.List
import Data.List.Split

encode :: String -> String
encode xs
  | l == 1    = normlzd
  | otherwise = intercalate " " $ transpose $ chunksOf c normlzd 
  where normlzd  = filter isAlphaNum $ map toLower xs
        l        = length normlzd
        c        = ceiling $ sqrt $ fromIntegral l
