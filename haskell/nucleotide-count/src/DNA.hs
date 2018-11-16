module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import qualified Data.Map as M

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

toNucleotide :: Char -> Maybe Nucleotide
toNucleotide x =
  case x of
    'A' -> Just A
    'C' -> Just C
    'G' -> Just G
    'T' -> Just T
    _ -> Nothing

incrementAt :: Nucleotide -> Map Nucleotide Int -> Map Nucleotide Int
incrementAt n = M.adjust succ n

countNucleotides :: String -> Map Nucleotide Int -> Maybe (Map Nucleotide Int)
countNucleotides [] map = Just map
countNucleotides (x:xs) map =
  case toNucleotide x of
    Just n  -> countNucleotides xs $ incrementAt n map
    Nothing -> Nothing

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs =
  case counts of
    Just m  -> Right m
    Nothing -> Left "you suck at DNA bro"
  where counts = countNucleotides xs $ M.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

