module School (School, add, empty, grade, sorted) where

import Data.List as L
import Data.Map (Map)
import qualified Data.Map as M

type School = Map Int [String]

add :: Int -> String -> School -> School
add gradeNum student school
  | M.member gradeNum school  = M.adjust (L.sort . (:) student) gradeNum school
  | otherwise                 = M.insert gradeNum [student] school

empty :: School
empty = M.empty

grade :: Int -> School -> [String]
grade gradeNum school = 
  case (M.lookup gradeNum school) of
    Just students -> students
    Nothing       -> []

sorted :: School -> [(Int, [String])]
sorted = M.toAscList
