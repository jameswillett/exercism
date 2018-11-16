module Diamond (diamond) where

import Data.Char (ord)

reflect :: [a] -> [a]
reflect s = (++s) $ reverse $ tail s

reflect' :: [a] -> [a]
reflect' = reflect . reverse

spaces :: Int -> String
spaces n = take n $ cycle " "

spacedChar :: Int -> Char -> String
spacedChar n c = h ++ [c] ++ t
  where cOrd  = ord c
        t     = spaces $ n - cOrd
        h     = spaces $ cOrd - 65
        
diamond :: Char -> Maybe [String]
diamond end
  | end `elem` ['A'..'Z'] = Just diamond 
  | otherwise             = Nothing
  where letters   = ['A'..end] 
        corner    = map (spacedChar $ ord end) letters
        diamond   = reflect' $ map reflect corner
