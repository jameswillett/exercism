module HelloWorld (hello) where

hello :: String
hello = map (\x -> toEnum x::Char) [72,101,108,108,111,44,32,87,111,114,108,100,33]
